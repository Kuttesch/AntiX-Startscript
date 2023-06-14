#!/usr/bin/env python3

import subprocess
import time

# Function to display status
def display_status(status):
    print(f"Status: {status}")

# Start Firefox in full screen mode
display_status("Starting Firefox in full screen mode...")
subprocess.Popen(["firefox", "-url", "http://localhost", "--kiosk"])
display_status("Firefox started.")

# Hide the cursor
display_status("Hiding the cursor...")
subprocess.Popen(["unclutter", "-idle", "0.1", "-root"])
display_status("Cursor hidden.")

# Run /etc/scripts/wlan.sh
display_status("Running /etc/scripts/wlan.sh...")
subprocess.run(["/etc/scripts/wlan.sh"])
display_status("/etc/scripts/wlan.sh executed.")

# End of script
display_status("Script execution complete.")
