#!/usr/bin/env bash

SERVICE="kanata-default.service"

# toggle kmonad
# Check if the service is active
if systemctl is-active --quiet $SERVICE; then
    # If active, stop both units with pkexec
    systemctl stop $SERVICE && notify-send "Kanata stopped"
else
    # If inactive, start with pkexec
    systemctl start $SERVICE && notify-send "Kanata started"
fi
