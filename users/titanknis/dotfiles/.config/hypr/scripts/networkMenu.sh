#!/usr/bin/env bash
# network-menu — WiFi & Bluetooth selector via Rofi

RECENT_FILE="$HOME/.local/state/network-menu-recent"
MAX_RECENT=5

# ── Recent device tracking ────────────────────────────────────────────────────
recent=()
[[ -f "$RECENT_FILE" ]] && mapfile -t recent <"$RECENT_FILE"

is_recent() {
    local id="$1"
    for r in "${recent[@]}"; do
        [[ "${r#*:}" == "$id" ]] && return 0
    done
    return 1
}

update_recent() {
    local key="$1:$2" # e.g. "wifi:MySSID" or "bt:AA:BB:CC"
    local updated=("$key")
    for r in "${recent[@]}"; do
        [[ "$r" == "$key" ]] && continue
        updated+=("$r")
    done
    printf '%s\n' "${updated[@]:0:$MAX_RECENT}" >"$RECENT_FILE"
}

# ── Three ordered buckets ─────────────────────────────────────────────────────
connected_entries=()
recent_entries=()
other_entries=()

# ── WiFi ──────────────────────────────────────────────────────────────────────
wifi_iface=$(nmcli -t -f DEVICE,TYPE dev 2>/dev/null | awk -F: '$2=="wifi"{print $1; exit}')
while IFS=: read -r inuse ssid signal _; do
    [[ -z "$ssid" ]] && continue
    if [[ "$inuse" == "*" ]]; then
        connected_entries+=("󰤨  $ssid  ● connected|wifi_disconnect|$ssid")
    else
        if ((signal >= 75)); then
            icon="󰤨"
        elif ((signal >= 50)); then
            icon="󰤥"
        elif ((signal >= 25)); then
            icon="󰤢"
        else icon="󰤟"; fi

        if is_recent "$ssid"; then
            recent_entries+=("󰐃 $icon  $ssid  (${signal}%)|wifi_connect|$ssid")
        else
            other_entries+=("$icon  $ssid  (${signal}%)|wifi_connect|$ssid")
        fi
    fi
done < <(nmcli --get-values IN-USE,SSID,SIGNAL,SECURITY dev wifi list 2>/dev/null |
    awk -F: '!seen[$2]++ && $2!=""' |
    sort -t: -k3 -rn)

# ── Bluetooth ─────────────────────────────────────────────────────────────────
if command -v bluetoothctl &>/dev/null; then
    while read -r _ mac name; do
        connected=$(bluetoothctl info "$mac" 2>/dev/null | awk '/Connected:/{print $2}')
        if [[ "$connected" == "yes" ]]; then
            connected_entries+=("󰂱  $name  ● connected|bt_disconnect|$mac")
        else
            if is_recent "$mac"; then
                recent_entries+=("󰐃 󰂯  $name|bt_connect|$mac")
            else
                other_entries+=("󰂯  $name|bt_connect|$mac")
            fi
        fi
    done < <(bluetoothctl devices 2>/dev/null)
fi

# Re-sort recent_entries to match the order they appear in the recent file
sorted_recent=()
for r in "${recent[@]}"; do
    rid="${r#*:}"
    for entry in "${recent_entries[@]}"; do
        id="${entry##*|}"
        [[ "$id" == "$rid" ]] && sorted_recent+=("$entry") && break
    done
done

entries=("${connected_entries[@]}" "${sorted_recent[@]}" "${other_entries[@]}")

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
        nmcli dev wifi connect "$id" &&
            update_recent wifi "$id" ||
            notify-send "WiFi" "Failed — no saved credentials for $id"
        ;;
    wifi_disconnect)
        nmcli dev disconnect "$wifi_iface" &&
            update_recent wifi "$id" &&
            notify-send "WiFi" "Disconnected"
        ;;
    bt_connect)
        bluetoothctl connect "$id" &&
            update_recent bt "$id" &&
            notify-send "Bluetooth" "Connected to $name"
        ;;
    bt_disconnect)
        bluetoothctl disconnect "$id" &&
            update_recent bt "$id" &&
            notify-send "Bluetooth" "Disconnected from $name"
        ;;
    esac
    break
done
