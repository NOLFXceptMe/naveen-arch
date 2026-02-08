#!/bin/bash
# 1. Renice xfwm4 to maximum priority for smooth Alt-Tabbing
# -20 is the highest priority; requires no password if run via systemd user service with permissions
PGID=$(pgrep xfwm4)
if [ -n "$PGID" ]; then
    renice -n -20 -p "$PGID"
fi

# 2. Steam Video Lag Fix (WebHelper optimization)
# Ensures Steam's web process doesn't get throttled
pgrep -f "steamwebhelper" | xargs -r renice -n -5
