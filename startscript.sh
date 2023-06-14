#!/bin/bash

# Start Firefox in full screen mode
firefox -url http://localhost --kiosk &

# Hide the cursor
unclutter -idle 0.1 -root &
