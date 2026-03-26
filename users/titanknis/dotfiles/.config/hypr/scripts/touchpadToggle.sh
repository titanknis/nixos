#!/usr/bin/env bash

# toggle touchpad activation

# Define the state file and your touchpad device name.
STATE_FILE="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/touchpad.state"
TOUCHPAD=$(hyprctl devices -j | jq -r '.mice[] | select(.name | test("touchpad";"i")) | .name' | head -1)

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
else
    hyprctl keyword "device[$TOUCHPAD]:enabled" true &&
        echo "enabled" >"$STATE_FILE"
fi
