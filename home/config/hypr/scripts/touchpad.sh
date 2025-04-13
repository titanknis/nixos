#!/usr/bin/env bash

# Define the state file and your touchpad device name.
STATE_FILE="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/touchpad.state"
TOUCHPAD="elan0709:00-04f3:30a0-touchpad"

# Read the current state (default to enabled if file not present).
if [ -f "$STATE_FILE" ]; then
    CURRENT=$(cat "$STATE_FILE")
else
    CURRENT="enabled"
fi

# Toggle state.
if [ "$CURRENT" = "enabled" ]; then
    hyprctl keyword "device[$TOUCHPAD]:enabled" false &&
        echo "disabled" >"$STATE_FILE"
    # notify-send "Touchpad disabled"
else
    hyprctl keyword "device[$TOUCHPAD]:enabled" true &&
        echo "enabled" >"$STATE_FILE"
    # notify-send "Touchpad enabled"
fi
