#!/bin/bash

# Function to display status
display_status() {
    echo "Status: $1"
}

# Function to check internet connectivity
check_internet_connectivity() {
    ping -c 1 google.com >/dev/null 2>&1
    if [[ $? -eq 0 ]]; then
        display_status "Internet connectivity is available."
    else
        display_status "No internet connectivity. Attempting connection..."
        nmcli device wifi connect "WLAN" password "PW"
        display_status "Connection attempt complete."
    fi
}

# Rescan available Wi-Fi networks
display_status "Rescanning available Wi-Fi networks..."
nmcli device wifi rescan
display_status "Wi-Fi networks rescan complete."

# Check and connect to WLAN every 10 seconds
while true; do
    check_internet_connectivity
    sleep 1800 # Sleep for 1800 seconds
done
