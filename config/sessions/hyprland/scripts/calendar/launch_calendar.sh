#!/usr/bin/env bash

QML_PATH="$HOME/.config/hypr/scripts/calendar/CalendarPopup.qml"

# Toggle logic: If running, kill it. If not, start it.
if pgrep -f "quickshell.*CalendarPopup.qml" > /dev/null; then
    pkill -f "quickshell.*CalendarPopup.qml"
    exit 0
fi

quickshell -p "$QML_PATH" &

# Ensure enough time for the window to actually render before attempting focus
sleep 0.2

# Explicitly focus the exact window title to avoid Hyprland confusing it with other quickshell instances
hyprctl dispatch focuswindow "title:calendar_win"
