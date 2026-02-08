#!/bin/bash
# Naveen's Optimization Daemon

while true; do
    # 1. Renice xfwm4 (Check every loop in case of WM restarts)
    WM_PID=$(pgrep xfwm4)
    if [ -n "$WM_PID" ]; then
        renice -n -20 -p "$WM_PID" > /dev/null 2>&1
    fi

    # 2. Steam Video Lag Fix
    # Finds all webhelpers and boosts them
    pgrep -f "steamwebhelper" | xargs -r renice -n -5 > /dev/null 2>&1

    # Sleep for 60 seconds to keep CPU usage at near-zero
    sleep 60
done
