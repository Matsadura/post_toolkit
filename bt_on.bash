#!/usr/bin/env bash

echo "Turning on Bluetooth"
bluetoothctl power on

echo "Scanning for devices..."
bluetoothctl scan on >/tmp/bt_on.tmp 2>1 &

PID=$!
sleep 10

bluetoothctl scan off

echo "Ending scan"
kill ${PID} 2>&1>/dev/null

echo "Connecting to USER_HERE's device"
bluetoothctl connect MAC_HERE

clear

sleep 2
journalctl -b --user-unit pulseaudio -g "Battery Level" -o cat | tail -n1
