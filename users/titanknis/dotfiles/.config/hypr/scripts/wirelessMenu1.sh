#!/usr/bin/env bash
# network-menu — WiFi & Bluetooth selector via Rofi

entries=()

# ── WiFi ──────────────────────────────────────────────────────────────────────
wifi_iface=$(nmcli -t -f DEVICE,TYPE dev 2>/dev/null | awk -F: '$2=="wifi"{print $1; exit}')

while IFS=: read -r inuse ssid signal _; do
    [[ -z "$ssid" ]] && continue
    if [[ "$inuse" == "*" ]]; then
        entries+=("󰤨  $ssid  ● connected|wifi_disconnect|$ssid")
    else
        if ((signal >= 75)); then
            icon="󰤨"
        elif ((signal >= 50)); then
            icon="󰤥"
        elif ((signal >= 25)); then
            icon="󰤢"
        else icon="󰤟"; fi
        entries+=("$icon  $ssid  (${signal}%)|wifi_connect|$ssid")
    fi
done < <(nmcli --get-values IN-USE,SSID,SIGNAL,SECURITY dev wifi list 2>/dev/null |
    awk -F: '!seen[$2]++ && $2!=""' |
    sort -t: -k3 -rn)

# ── Bluetooth ─────────────────────────────────────────────────────────────────
if command -v bluetoothctl &>/dev/null; then
    while read -r _ mac name; do
        connected=$(bluetoothctl info "$mac" 2>/dev/null | awk '/Connected:/{print $2}')
        if [[ "$connected" == "yes" ]]; then
            entries+=("󰂱  $name  ● connected|bt_disconnect|$mac")
        else
            entries+=("󰂯  $name|bt_connect|$mac")
        fi
    done < <(bluetoothctl devices 2>/dev/null)
fi

[[ ${#entries[@]} -eq 0 ]] && {
    notify-send "Network Menu" "No devices found"
    exit 1
}

# ── Rofi ──────────────────────────────────────────────────────────────────────
display=$(printf '%s\n' "${entries[@]}" | cut -d'|' -f1)
chosen=$(echo "$display" | rofi -dmenu -p "  Devices:" -i -l "${#entries[@]}")
[[ -z "$chosen" ]] && exit 0

# ── Dispatch ──────────────────────────────────────────────────────────────────
for entry in "${entries[@]}"; do
    label="${entry%%|*}"
    rest="${entry#*|}"
    action="${rest%%|*}"
    id="${rest#*|}"
    [[ "$label" == "$chosen" ]] || continue

    case "$action" in
    wifi_connect)
        nmcli dev wifi connect "$id" ||
            notify-send "WiFi" "Failed — unknown network (no saved credentials for $id)"
        ;;
    wifi_disconnect)
        nmcli dev disconnect "$wifi_iface" &&
            notify-send "WiFi" "Disconnected"
        ;;
    bt_connect)
        bluetoothctl connect "$id" &&
            notify-send "Bluetooth" "Connected to $name"
        ;;
    bt_disconnect)
        bluetoothctl disconnect "$id" &&
            notify-send "Bluetooth" "Disconnected from $name"
        ;;
    esac
    break
done
