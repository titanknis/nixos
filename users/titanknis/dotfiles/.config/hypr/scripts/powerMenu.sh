#!/usr/bin/env bash

chosen=$(printf "󰐥 Shutdown\n Reboot\n󰍃 Logout\n Lock\n Hibernate\n󰤄 Suspend" | rofi -dmenu -p "Power Menu:" -i -l 6)

case "$chosen" in
"󰐥 Shutdown") shutdown now ;;
" Reboot") reboot ;;
"󰍃 Logout") hyprctl dispatch exit ;;
" Lock") hyprlock ;;
" Hibernate") systemctl hibernate ;;
"󰤄 Suspend") systemctl suspend ;;
*) exit 1 ;;
esac
