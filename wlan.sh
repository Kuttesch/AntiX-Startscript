#!/bin/bash

# Function to display status
display_status() {
    echo "Status: $1"
}

# Function to check and connect to WLAN
check_and_connect_wlan() {
    connected=$(nmcli -g GENERAL.STATE connection show --active | grep "WLAN")
    if [[ "$connected" == "100" ]]; then
        display_status "System is already connected to WLAN."
    else
        display_status "System is not connected to WLAN. Attempting connection..."
        nmcli device wifi connect "WLAN" password "Password"
        display_status "Connection attempt complete."
    fi
}

# Check and connect to WLAN every 30 minutes
while true; do
    check_and_connect_wlan
    sleep 1800 # Sleep for 30 minutes
done
