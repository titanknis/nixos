#!/usr/bin/env bash

SERVICE="kmonad-myKMonadOutput.service"
PATH_UNIT="kmonad-myKMonadOutput.path"

# toggle kmonad
# Check if the service is active
if systemctl is-active --quiet $SERVICE; then
    # If active, stop both units with pkexec
    pkexec systemctl stop $SERVICE $PATH_UNIT
    notify-send "KMonad" "Service and path stopped"
else
    # If inactive, start both units with pkexec
    pkexec systemctl start $SERVICE $PATH_UNIT
    notify-send "KMonad" "Service and path started"
fi
