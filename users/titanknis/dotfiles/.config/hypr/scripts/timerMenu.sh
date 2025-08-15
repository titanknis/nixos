#!/usr/bin/env bash

#=============================================================================
# ROFI POMODORO TIMER
#=============================================================================
# A Rofi-based Pomodoro timer with support for multiple concurrent timers,
# pause/resume functionality, and session tracking using JSON state storage.
#
# Features:
# - Traditional Pomodoro technique (25m work, 5m break, 15m long break)
# - Multiple concurrent timers
# - Pause/resume support (TODO: currently commented out)
# - Skip sessions        (TODO: currently commented out)
# - JSON-based state persistence
# - Desktop notifications
#=============================================================================

#-----------------------------------------------------------------------------
# CONFIGURATION
#-----------------------------------------------------------------------------
# Timer durations - can be overridden by environment variables
WORK_TIME=${POMO_WORK:-25m}   # Default work period (25 minutes)
SHORT_BREAK=${POMO_SHORT:-5m} # Default short break (5 minutes)
LONG_BREAK=${POMO_LONG:-15m}  # Default long break (15 minutes)
CYCLES=4                      # Number of work cycles before long break
GRACE=${GRACE:-10s}           # Grace period (unused in current implementation)
MENU_ITEMS=${MENU_ITEMS:-"pomo\npause\nresume\nskip\nremove\nclear"}
ITEMS_COUNT=${ITEMS_COUNT:-$(echo -e "$MENU_ITEMS" | wc -l)}
RUN_ICON=${ICON_RUN:-"▶"}     # TODO: this needs nerd font
PAUSE_ICON=${ICON_PAUSE:-"󰏤"} # TODO: this needs nerd font
STOP_ICON=${ICON_STOP:-"󰓛"}   # TODO: this needs nerd font

# File paths
CACHE_DIR="$HOME/.cache/rofi-timer"
STATE_FILE="$CACHE_DIR/timers.json"

#-----------------------------------------------------------------------------
# INITIALIZATION
#-----------------------------------------------------------------------------
# Create cache directory and initialize state file
mkdir -p "$CACHE_DIR"
if [[ ! -e $STATE_FILE || -z $(cat "$STATE_FILE") ]]; then
    echo '[]' >"$STATE_FILE"
fi

#-----------------------------------------------------------------------------
# UTILITY FUNCTIONS
#-----------------------------------------------------------------------------

# can add hooks here for example for custom sound notification
session_notify() {
    notify-send "$@"
    echo "$@"
}

timer_notify() {
    notify-send "$@"
    echo "$@"
}

feedback_notify() {
    notify-send "$@"
    echo "$@"
}

# Convert time string (e.g., "1h30m45s") to total seconds
str_to_seconds() {
    local time_str="$1"
    local total_seconds=0

    # Extract hours (e.g., "2h" -> 2 * 3600 seconds)
    if [[ $time_str =~ ([0-9]+)h ]]; then
        total_seconds=$((total_seconds + ${BASH_REMATCH[1]} * 3600))
    fi

    # Extract minutes (e.g., "30m" -> 30 * 60 seconds)
    if [[ $time_str =~ ([0-9]+)m ]]; then
        total_seconds=$((total_seconds + ${BASH_REMATCH[1]} * 60))
    fi

    # Extract seconds (e.g., "45s" or "45" -> 45 seconds)
    if [[ $time_str =~ ([0-9]+)s?$ ]]; then
        total_seconds=$((total_seconds + ${BASH_REMATCH[1]}))
    fi

    echo $total_seconds
}

seconds_to_label() {
    local seconds=$1
    if ((seconds >= 3600)); then
        printf "%dh%02dm" $((seconds / 3600)) $(((seconds % 3600) / 60))
    elif ((seconds >= 60)); then
        printf "%dm" $((seconds / 60))
    else
        printf "%ds" "$seconds"
    fi
}

show_timers() {
    local status_to_show="$1"

    jq -r '.[] | "\(.id)|\(.status)|\(.start_timestamp)|\(.elapsed_time)|\(.sessions[.session])|\(.messages[.session])|\(.session)|\(.sessions|length)"' "$STATE_FILE" |
        while IFS='|' read -r id status start_ts elapsed_time session_duration session_message current_session total_sessions; do

            if [[ -n $status_to_show && $status_to_show != $status ]]; then
                continue
            fi

            # Calculate remaining time for current session
            if [[ "$status" == "running" ]]; then
                local end_ts=$((start_ts + session_duration - elapsed_time))
                local now=$(date "+%s")
                local remaining_seconds=$((end_ts - now))
            else
                local remaining_seconds=$((session_duration - elapsed_time))
            fi

            # Handle negative time
            ((remaining_seconds < 0)) && remaining_seconds=0
            # Format time as HH:MM:SS
            local formatted_time=$(seconds_to_label $remaining_seconds)

            # Create intuitive status indicators
            local status_icon
            case "$status" in
            running) status_icon=$RUN_ICON ;;
            paused) status_icon=$PAUSE_ICON ;;
            *) status_icon=$STOP_ICON ;;
            esac

            # Enhanced session information
            local session_info
            if ((total_sessions > 1)); then
                session_info="[$((current_session + 1))/$total_sessions] "
            else
                session_info=""
            fi

            echo "[#$id] $status_icon $session_info${session_message%%:*} - $formatted_time"
        done
}

#-----------------------------------------------------------------------------
# USER INTERFACE
#-----------------------------------------------------------------------------

# Display Rofi menu with timer options
_rofi() {
    local msg
    msg=$(show_timers)

    if [[ -z $msg ]]; then
        # No active timers - show simple menu
        echo "$(printf "$MENU_ITEMS" | rofi -dmenu -p "󱎫 " -l $ITEMS_COUNT)"
    else
        # Show menu with active timer information
        echo "$(printf "$MENU_ITEMS" | rofi -dmenu -p "󱎫 " -mesg "$msg" -l $ITEMS_COUNT)"
    fi
}

#-----------------------------------------------------------------------------
# TIMER MANAGEMENT
#-----------------------------------------------------------------------------

# Register a new timer in the state file
register_timer() {
    local id pid start_timestamp status sessions_json messages_json

    # Generate unique timer ID
    id=$(jq 'map(.id) | max + 1' "$STATE_FILE" 2>/dev/null || echo 1)
    pid=$$
    start_timestamp=$(date +%s)
    status="running"

    # Convert arrays to JSON format
    sessions_json=$(printf '%s\n' "${SESSIONS[@]}" | jq -R . | jq -s .)
    messages_json=$(printf '%s\n' "${MESSAGES[@]}" | jq -R . | jq -s .)

    # Add new timer entry to state file
    jq --argjson id "$id" \
        --argjson pid "$pid" \
        --arg status "$status" \
        --argjson start_timestamp "$start_timestamp" \
        --argjson elapsed_time 0 \
        --argjson session 0 \
        --argjson sessions "$sessions_json" \
        --argjson messages "$messages_json" \
        --arg post_timer_message "$POST_TIMER_MESSAGE" \
        '. += [{
            id: $id, 
            pid: $pid, 
            status: $status, 
            start_timestamp: $start_timestamp, 
            elapsed_time: $elapsed_time, 
            session: $session, 
            sessions: $sessions, 
            messages: $messages,
            post_timer_message: $post_timer_message, 
        }]' \
        "$STATE_FILE" >tmp && mv tmp "$STATE_FILE" || exit 1
}

# Remove timer from state file
unregister_timer() {
    case "$1" in
    [0-9]*)
        # Remove timer by timer ID
        jq "map(select(.id != $1))" "$STATE_FILE" >tmp && mv tmp "$STATE_FILE"
        ;;
    pid)
        # Remove timer by process ID
        jq "map(select(.pid != $2))" "$STATE_FILE" >tmp && mv tmp "$STATE_FILE"
        ;;
    *)
        # Remove timer by process ID
        jq "map(select(.pid != $$))" "$STATE_FILE" >tmp && mv tmp "$STATE_FILE"
        ;;
    esac
}

# Remove a specific timer (with user interaction)
remove_timer() {
    local id pid id_exists pid_exists items

    # Get timer ID from parameter or user selection
    id=${1:-$(show_timers | rofi -dmenu -p "remove" -l $ITEMS_COUNT)}
    [[ -n $id ]] || return

    # Extract ID from formatted string if necessary
    [[ $id =~ \[#([0-9]+)\] ]] && id=${BASH_REMATCH[1]}

    # Handle removal by PID (internal use)
    if [[ "$1" == "pid" ]]; then
        local pid=$2
        pid_exists=$(jq --argjson pid "$pid" 'any(.[]; .pid == $pid)' "$STATE_FILE")
        if [[ "$pid_exists" != "true" ]]; then
            rofi -e "pid:$pid timer does not exist"
            return
        fi
    fi

    # Verify timer exists
    id_exists=$(jq "any(.[]; .id == $id)" "$STATE_FILE")
    if [[ "$id_exists" != "true" ]]; then
        rofi -e "id:$id timer does not exist"
        return
    fi

    # Get PID and kill the process
    pid=$(jq ".[] | select(.id == $id) | .pid" "$STATE_FILE") || return
    kill "$pid" 2>/dev/null

    # Remove from state file
    unregister_timer pid "$pid"
}

# Clear all active timers
clear_timers() {
    # Kill all timer processes
    while read -r pid; do
        kill "$pid" 2>/dev/null
    done < <(jq -r ".[].pid" "$STATE_FILE")

    # Reset state file
    echo "[]" >"$STATE_FILE"

    feedback_notify "All timers cleared"
}

run_registered_timer() {
    mapfile -t SESSIONS < <(jq -r --argjson pid $$ '.[] | select(.pid == $pid) | .sessions[]' "$STATE_FILE")
    mapfile -t MESSAGES < <(jq -r --argjson pid $$ '.[] | select(.pid == $pid) | .messages[]' "$STATE_FILE")
    POST_TIMER_MESSAGE="$(jq -r --argjson pid $$ '.[] | select(.pid == $pid) | .post_timer_message' "$STATE_FILE")"
    local session_idx="$(jq -r --argjson pid $$ '.[] | select(.pid == $pid) | .session' "$STATE_FILE")"
    local elapsed_time="$(jq -r --argjson pid $$ '.[] | select(.pid == $pid) | .elapsed_time' "$STATE_FILE")"

    # Execute each session in sequence
    for ((i = session_idx; i < ${#SESSIONS[@]}; i++)); do
        # Show notification for current session
        session_notify "${MESSAGES[$i]}"

        # Wait for session duration
        sleep "$((${SESSIONS[$i]} - elapsed_time))"
        elapsed_time=0

        # Update session progress in state file
        current_ts=$(date +%s)
        jq --argjson pid "$$" --argjson current_ts "$current_ts" --argjson elapsed_time "$elapsed_time" '
            map(
                if (.pid == $pid) then
                    .session += 1 |
                    .start_timestamp = $current_ts |
                    .elapsed_time = $elapsed_time
                else .
                end
            )
        ' "$STATE_FILE" >"$STATE_FILE.tmp" && mv "$STATE_FILE.tmp" "$STATE_FILE"
    done
    timer_notify "$POST_TIMER_MESSAGE"
}

# Execute a timer sequence
run_timer() {
    # Register this timer in the state file
    register_timer
    run_registered_timer
    unregister_timer
}

# Run complete Pomodoro cycle
run_pomodoro() {
    # Initialize Pomodoro session arrays
    SESSIONS=()
    MESSAGES=()
    POST_TIMER_MESSAGE="Pomodoro completed!All cycles finished"

    # Build Pomodoro cycle (work -> break -> work -> break -> ... -> long break)
    for ((cycle = 1; cycle <= CYCLES; cycle++)); do
        # Add work period
        SESSIONS+=("$(str_to_seconds "$WORK_TIME")")
        MESSAGES+=("Work")

        # Add break period
        if [[ $cycle -eq $CYCLES ]]; then
            SESSIONS+=("$(str_to_seconds "$LONG_BREAK")")
            MESSAGES+=("Long break")
        else
            SESSIONS+=("$(str_to_seconds "$SHORT_BREAK")")
            MESSAGES+=("Break")
        fi
    done

    run_timer
}
#-----------------------------------------------------------------------------
# PAUSE/RESUME FUNCTIONALITY (TODO)
#-----------------------------------------------------------------------------
# Note: The following functions are commented out in the original script
# They provide pause/resume and skip functionality but need debugging

# TODO: Implement pause functionality
pause_timer() {
    local now id pid
    now=$(date +%s)

    id=${1:-$(show_timers "running" | rofi -dmenu -p "pause" -l $ITEMS_COUNT)}
    [[ -n $id ]] || return
    [[ $id =~ \[#([0-9]+)\] ]] && id=${BASH_REMATCH[1]}

    id_exists=$(jq "any(.[]; .id == $id and .status == \"running\" )" "$STATE_FILE")
    if [[ "$id_exists" != "true" ]]; then
        rofi -e "id:$id timer is not running or does not exist"
        return
    fi

    pid=$(jq ".[] | select(.id == $id) | .pid" "$STATE_FILE") || return
    kill "$pid"

    # Update JSON file in-place: set status to "paused", update elapsed_time = now - start_timestamp
    jq --argjson now "$now" --argjson id "$id" '
        map(
            if .id == ($id) then
                .status = "paused" |
                .elapsed_time += ($now - .start_timestamp)
            else
                .
            end
        )
    ' "$STATE_FILE" >"$STATE_FILE.tmp" && mv "$STATE_FILE.tmp" "$STATE_FILE"
}

# TODO: Implement resume functionality
resume_timer() {
    local now id pid
    now=$(date +%s)

    id=${1:-$(show_timers "paused" | rofi -dmenu -p "pause" -l $ITEMS_COUNT)}
    [[ -n $id ]] || return
    [[ $id =~ \[#([0-9]+)\] ]] && id=${BASH_REMATCH[1]}

    id_exists=$(jq "any(.[]; .id == $id and .status == \"paused\" )" "$STATE_FILE")
    if [[ "$id_exists" != "true" ]]; then
        rofi -e "id:$id timer is not paused or does not exist"
        return
    fi

    # Update JSON file in-place:
    jq --argjson pid $$ --argjson now "$now" --argjson id "$id" '
        map(
            if .id == ($id) then
                .pid = $pid |
                .status = "running" |
                .start_timestamp = $now
            else
                .
            end
        )
    ' "$STATE_FILE" >"$STATE_FILE.tmp" && mv "$STATE_FILE.tmp" "$STATE_FILE"
    run_registered_timer
    unregister_timer
}

# TODO: Implement skip session functionality
skip_session() {
    local now id pid
    now=$(date +%s)

    id=${1:-$(show_timers | rofi -dmenu -p "skip" -l $ITEMS_COUNT)}
    [[ -n $id ]] || return
    [[ $id =~ \[#([0-9]+)\] ]] && id=${BASH_REMATCH[1]}

    id_exists=$(jq "any(.[]; .id == $id )" "$STATE_FILE")
    if [[ "$id_exists" != "true" ]]; then
        rofi -e "id:$id timer does not exist"
        return
    fi

    pid=$(jq ".[] | select(.id == $id) | .pid" "$STATE_FILE") || return
    kill "$pid"

    # Update JSON file in-place:
    jq --argjson pid $$ --argjson now "$now" --argjson id "$id" '
        map(
            if .id == ($id) then
                .pid = $pid |
                .status = "running" |
                .start_timestamp = $now |
                .elapsed_time = 0 |
                .session += 1
            else
                .
            end
        )
    ' "$STATE_FILE" >"$STATE_FILE.tmp" && mv "$STATE_FILE.tmp" "$STATE_FILE"
    run_registered_timer
    unregister_timer
}

#-----------------------------------------------------------------------------
# MAIN PROGRAM LOGIC
#-----------------------------------------------------------------------------

# Main function to handle user commands
main() {
    case "$1" in
    pomo | doro | pomodoro)
        run_pomodoro
        ;;
    pause)
        pause_timer "${@:2}" # TODO: Uncomment when implemented
        # rofi -e "Pause functionality not yet implemented"
        ;;
    resume)
        resume_timer "${@:2}" # TODO: Uncomment when implemented
        # rofi -e "Resume functionality not yet implemented"
        ;;
    skip)
        skip_session "${@:2}" # TODO: Uncomment when implemented
        # rofi -e "Skip functionality not yet implemented"
        ;;
    rm | remove)
        remove_timer "${@:2}"
        ;;
    clear)
        clear_timers
        ;;
    *)

        # Handle custom time format (e.g., "1h30m", "45m", "30s") TODO:
        local sessions_str=($*)
        SESSIONS=()
        MESSAGES=()
        POST_TIMER_MESSAGE="Timer sequence completed"

        for i in "${!sessions_str[@]}"; do
            local seconds=$(str_to_seconds "${sessions_str[$i]}")
            local time_label=$(seconds_to_label "$seconds") # New helper function
            SESSIONS+=("$seconds")
            MESSAGES+=("Session $((i + 1))/${#sessions_str[*]}: $time_label")
        done

        # Special case: if only one session, simplify message
        if [[ ${#sessions_str[@]} == 1 ]]; then
            local seconds=$(str_to_seconds "${sessions_str[0]}")
            local time_label=$(seconds_to_label "$seconds")
            MESSAGES=("Session: $time_label")
        fi
        run_timer
        ;;
    esac
}

#-----------------------------------------------------------------------------
# PROGRAM ENTRY POINT
#-----------------------------------------------------------------------------

# Show Rofi menu and get user selection
timer_command_str=$(_rofi)

# Exit if user canceled selection
[[ -z "$timer_command_str" ]] && exit 0

# Execute the selected command
main $timer_command_str
