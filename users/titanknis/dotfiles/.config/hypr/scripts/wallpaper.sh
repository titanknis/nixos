#!/usr/bin/env bash

# Simple random wallpaper switcher for swww with smooth transitions
# Features: Avoids consecutive duplicates, random transitions, configurable timing

# --- USER CONFIGURATION ---
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"            # Directory containing wallpapers
CURRENT_WALLPAPER="$WALLPAPER_DIR/current_wallpaper" # Symlink to current wallpaper
INTERVAL=300                                         # Seconds between wallpaper changes

# Transition settings (randomly selected each time)
TRANSITIONS=(fade left right wipe center any outer) # Available transition types
export SWWW_TRANSITION_FPS=60                       # Animation smoothness
export SWWW_TRANSITION_STEP=90                      # Animation speed
# export SWWW_TRANSITION_STEP=255 # Animation speed

# --- SCRIPT INITIALIZATION ---
# Start swww daemon if not running
pgrep -x swww-daemon >/dev/null || swww-daemon &

# --- MAIN LOOP ---
while true; do
    # FEATURE: Avoid consecutive duplicates by excluding current wallpaper
    if [[ -e $CURRENT_WALLPAPER ]]; then
        # Find wallpapers excluding current file
        wallpaper=$(find "$WALLPAPER_DIR" -type f -regextype posix-extended -iregex '.*\.(jpg|jpeg|png|webp|gif)' ! -samefile "$(readlink -f "$CURRENT_WALLPAPER")" | shuf -n 1)
    else
        # First run or no current wallpaper
        wallpaper=$(find "$WALLPAPER_DIR" -type f -regextype posix-extended -iregex '.*\.(jpg|jpeg|png|webp|gif)' | shuf -n 1)
    fi

    # Handle cases where no wallpaper is found
    if [[ -z "$wallpaper" ]]; then
        if [[ -e "$CURRENT_WALLPAPER" ]]; then
            echo "No other wallpapers found. Keeping current."
        else
            echo "Error: No wallpapers found in $WALLPAPER_DIR"
            echo "       Add supported images (jpg/png/webp/gif)"
        fi
        sleep "$INTERVAL"
        continue
    fi

    # Update wallpaper symlink and display new wallpaper
    echo "Changing to: $wallpaper"
    ln -sf "$wallpaper" "$CURRENT_WALLPAPER"

    # Apply with random transition effect and angle
    swww img "$wallpaper" \
        --transition-type "${TRANSITIONS[$((RANDOM % ${#TRANSITIONS[@]}))]}" \
        --transition-angle $((RANDOM % 360))

    # Wait before next change
    sleep "$INTERVAL"
done
