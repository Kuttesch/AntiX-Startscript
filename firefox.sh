#!/bin/bash

# Function to display status
display_status() {
    echo "Status: $1"
}

# Start Firefox in full screen mode
display_status "Starting Firefox in full screen mode..."
firefox -url http://localhost --kiosk &

# Sleep for a few seconds to allow Firefox to start
sleep 30

# Check if Firefox is running in full screen
if pgrep -x "firefox" >/dev/null && wmctrl -l | grep -q "Mozilla Firefox" && xdotool getactivewindow getwindowgeometry | grep -q "Fullscreen"; then
else
    display_status "Firefox is not running in full screen. Restarting in 30 seconds..."
    sleep 30
    exec "$0" "$@" # Restart the script
fi

# End the script
display_status "Firefox execution complete."
exit 0
