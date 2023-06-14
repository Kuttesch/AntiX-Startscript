#!/bin/bash

# Function to display status
display_status() {
    echo "Status: $1"
}

# Function to check and connect to WLAN
check_and_connect_wlan() {
    connected=$(nmcli connection show --active | grep "WLAN")
    if [[ -n "$connected" ]]; then
        display_status "System is already connected to WLAN."
    else
        display_status "System is not connected to WLAN. Attempting connection..."
        nmcli device wifi connect "WLAN" password "Password"
        display_status "Connection attempt complete."
    fi
}

# Rescan available Wi-Fi networks
display_status "Rescanning available Wi-Fi networks..."
nmcli device wifi rescan
display_status "Wi-Fi networks rescan complete."

# Check and connect to WLAN every 10 seconds
while true; do
    check_and_connect_wlan
    sleep 1800 # Sleep for 1800 seconds
done
