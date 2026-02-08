#!/usr/bin/env bash
# Simple toggle - if brightness is not 0, save it and set to 0
# If brightness is 0, restore saved value or default to 100%

LOCK_FILE="/tmp/brightness-value"

if [ -f "$LOCK_FILE" ]; then
    # Restore previous brightness
    brightnessctl set "$(cat $LOCK_FILE)"
    rm "$LOCK_FILE"
    echo "Screen ON (restored brightness)"
else
    # Save current brightness and set to 0
    brightnessctl get >"$LOCK_FILE"
    brightnessctl set 0
    echo "Screen OFF (brightness: 0%)"
fi
