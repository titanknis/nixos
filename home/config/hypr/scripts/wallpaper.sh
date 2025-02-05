#!/usr/bin/env bash

WALLPAPER_DIR=~/Wallpapers
INTERVAL=300

# none │ simple │ fade │ left │ right │ top │ bottom │ wipe │ wave │ grow │ center │ any │ outer │ random
TRANSITIONS=( fade left right wipe center any outer ) 
# removed top bottom (the bezier curve looks better with left and right, also the wipe transition is better)
# removed simple( fade is better )
# removed fade(because i just like clear transitions)
# removed grow( it is redundent with center and any )
# removed wave( because i like transitions straight)
# removed random( because my script handle random animations better )

# Edit below to control the images transition
export SWWW_TRANSITION_FPS=60
export SWWW_TRANSITION_STEP=90
export SWWW_TRANSITION_WAVE=30,10

# Start swww-daemon if not already running
if ! pgrep -x swww-daemon > /dev/null; then
    swww-daemon &
fi

while true; do
    # Get a random wallpaper file
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f -regex '.*\.\(jpg\|jpeg\|png\|webp\|gif\)' | shuf -n 1)
    # Get a random transition
    TRANSITION=$(shuf -e "${TRANSITIONS[@]}" -n 1)
    ANGLE=$((RANDOM % 360))

    # Check if we found any wallpapers
    if [ -z "$WALLPAPER" ]; then
        echo "No wallpapers found in $WALLPAPER_DIR"
        echo "Please add some image files (jpg, jpeg, png, webp, or gif)"
        sleep "$INTERVAL"
        continue
    fi

    # Only change if it's a different wallpaper
    if [[ "$PREVIOUS_WALLPAPER" != "$WALLPAPER" ]];then
        echo "Changing wallpaper to:$(basename "$WALLPAPER")"
        echo "Using the transition:$TRANSITION"
        swww img \
            "$WALLPAPER" \
            --transition-type  $TRANSITION \
            --transition-angle $ANGLE \

        PREVIOUS_WALLPAPER="$WALLPAPER"
        sleep "$INTERVAL"
    fi
done

