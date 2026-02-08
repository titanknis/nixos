#!/usr/bin/env bash
#
# Interactive Wallpaper Selector using Rofi and swww
# Features: Thumbnail previews, random transitions, persistent current selection
# -----------------------------------------------------------------------------

# ─── CONFIGURATION ────────────────────────────────────────────────────────────
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"            # Search directory for wallpapers
CURRENT_WALLPAPER="$WALLPAPER_DIR/current_wallpaper" # Tracks current selection
ROFI_THEME="$HOME/.config/rofi/imagepicker.rasi"     # Rofi configuration with thumbnail support

# Transition effects (randomly selected on apply)
TRANSITIONS=(fade left right wipe center any outer) # Visual effect options
export SWWW_TRANSITION_FPS=60                       # Animation fluidity (frames per second)
export SWWW_TRANSITION_STEP=90                      # Animation speed (pixel steps)

# ─── ENSURE SWWW IS RUNNING ───────────────────────────────────────────────────
pgrep -x swww-daemon >/dev/null || swww-daemon & # Launch swww if inactive

# ─── DISCOVER WALLPAPERS ──────────────────────────────────────────────────────
# Find supported image formats (case-insensitive match)
mapfile -t wallpapers < <(
    find "$WALLPAPER_DIR" -type f -regextype posix-extended -iregex '.*\.(jpg|jpeg|png|webp|gif)' | sort
)

# Exit gracefully if no wallpapers found
[ ${#wallpapers[@]} -eq 0 ] && echo "Error: No wallpapers in $WALLPAPER_DIR" && exit 1

# ─── DISPLAY INTERACTIVE SELECTOR ─────────────────────────────────────────────
# FEATURE: Visual previews via Rofi's icon support
menu=$(
    for i in "${!wallpapers[@]}"; do
        file="${wallpapers[$i]}"
        # Format: "Number. Filename [with embedded icon path]"
        printf "%d. %s\0icon\x1f%s\n" "$((i + 1))" "${file##*/}" "$file"
    done | rofi -dmenu -i -theme "$ROFI_THEME" -p "󰉏 wallpaper"
)

# ─── PROCESS USER CHOICE ──────────────────────────────────────────────────────
index=${menu%%.*} # Extract selection number

# Exit cleanly if no selection made (ESC key or empty)
[ -z "$index" ] && exit 0

# Retrieve full path of selected wallpaper
wallpaper="${wallpapers[$((index - 1))]}"

# ─── APPLY SELECTION ──────────────────────────────────────────────────────────
# Update persistent current wallpaper reference
ln -sf "$wallpaper" "$CURRENT_WALLPAPER"

# Apply with random visual effect
swww img "$wallpaper" \
    --transition-type "${TRANSITIONS[$((RANDOM % ${#TRANSITIONS[@]}))]}" \
    --transition-angle $((RANDOM % 360))
