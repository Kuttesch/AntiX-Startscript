# Function to display status
display_status() {
    echo "Status: $1"
}

# Hide the cursor
display_status "Hiding the cursor..."
unclutter -idle 0.1 -root &
display_status "Cursor hidden."

# Limit CPU frequency for four threads to 1GHz
display_status "Limiting CPU frequency to 1GHz for four threads..."
for i in {0..3}; do
    cpufreq-set -c $i -f 1GHz
done
display_status "CPU frequency limited."

# Run /etc/scripts/wlan.sh
display_status "Running /etc/scripts/wlan.sh..."
/etc/scripts/wlan.sh
display_status "/etc/scripts/wlan.sh executed."

# Run /etc/scripts/firefox.sh
display_status "Running /etc/scripts/firefox.sh..."
/etc/scripts/firefox.sh
display_status "/etc/scripts/firefox.sh executed."

# End of script
display_status "Startscript execution complete."
exit 0
