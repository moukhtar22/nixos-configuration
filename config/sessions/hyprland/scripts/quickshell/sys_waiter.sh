#!/usr/bin/env bash

# Debounce
sleep 0.1

# Kill any child listening jobs gracefully
trap 'kill -TERM $(jobs -p) 2>/dev/null; wait $(jobs -p) 2>/dev/null' EXIT

# Wrap each listener in a subshell that sleeps infinitely if the command fails.

# 1. Volume Waiter (FIXED: Added a space after 'sink' to completely ignore 'sink-input' spam)
( pactl subscribe 2>/dev/null | grep --line-buffered -m 1 "Event .* on sink " || sleep infinity ) &

# 2. Network
( nmcli monitor 2>/dev/null | grep --line-buffered -m 1 -E "connected|disconnected|unavailable|enabled|disabled" || sleep infinity ) &

# 3. Bluetooth 
( dbus-monitor --system "type='signal',interface='org.freedesktop.DBus.Properties',member='PropertiesChanged',arg0='org.bluez.Device1'" 2>/dev/null | grep --line-buffered -m 1 "interface" || sleep infinity ) &

# 4. Battery
( udevadm monitor --subsystem-match=power_supply 2>/dev/null | grep --line-buffered -m 1 "change" || sleep infinity ) &

# DELETED: The socat Hyprland IPC listener was here. It was destroying your shortcuts.

# Failsafe: Force a silent UI refresh every 60 seconds
sleep 60 &

# Wait for the *first* background job to successfully complete an event
wait -n

# Output a signal to ensure Quickshell registers the stream completion
echo "trigger"
