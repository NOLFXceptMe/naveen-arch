#!/bin/bash
# Naveen's Arch System Health Check
# This script validates if all optimizations from naveen-customization are active.

BOLD='\033[1m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

echo -e "${BOLD}--- Naveen's Arch System Validation ---${NC}
"

# 1. Kernel Check
echo -n "[1/5] Kernel Check: "
KERNEL=$(uname -r)
if [[ "$KERNEL" == *"-zen"* ]]; then
    echo -e "${GREEN}✅ Running linux-zen ($KERNEL).${NC}"
else
    echo -e "${RED}❌ NOT running zen kernel ($KERNEL).${NC}"
fi

# 2. Optimization Service Check
echo -n "[2/5] Optimization Service: "
if systemctl is-active xfwm4-priority.service >/dev/null 2>&1; then
    echo -e "${GREEN}✅ xfwm4-priority.service is ACTIVE (System Level).${NC}"
else
    echo -e "${RED}❌ xfwm4-priority.service is INACTIVE.${NC}"
fi

# 3. Process Niceness Check
echo -n "[3/5] XFWM4 Priority: "
WM_PID=$(pgrep xfwm4)
if [ -z "$WM_PID" ]; then
    echo -e "${YELLOW}⚠️ xfwm4 not found (are you in a different WM?).${NC}"
else
    WM_NI=$(ps -p "$WM_PID" -o ni= | tr -d ' ')
    if [ "$WM_NI" -lt 0 ]; then
        echo -e "${GREEN}✅ xfwm4 (PID $WM_PID) is high priority (NI $WM_NI).${NC}"
    else
        echo -e "${RED}❌ xfwm4 (PID $WM_PID) is at default priority (NI $WM_NI).${NC}"
    fi
fi

# 4. Logitech HID Check
echo -n "[4/5] Logitech HID: "
if lsmod | grep -q "hid_logitech_dj"; then
    echo -e "${GREEN}✅ hid_logitech_dj module loaded.${NC}"
else
    echo -e "${YELLOW}⚠️ hid_logitech_dj not loaded (ignore if not using Unifying/Bolt).${NC}"
fi

# 5. Keyboard Shortcut Config Check
echo -n "[5/5] Keyboard Config: "
TARGET_CONFIG="/etc/xdg-naveen/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml"
if [ -f "$TARGET_CONFIG" ]; then
    if grep -q "ghostty" "$TARGET_CONFIG"; then
        echo -e "${GREEN}✅ Custom shortcuts found in /etc/xdg-naveen/.${NC}"
    else
        echo -e "${YELLOW}⚠️ Custom config exists but 'ghostty' not found.${NC}"
    fi
else
    echo -e "${RED}❌ Custom keyboard config MISSING from /etc/xdg-naveen/.${NC}"
fi

echo -e "
${BOLD}Validation Complete.${NC}"
