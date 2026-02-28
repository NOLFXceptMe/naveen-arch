#!/bin/bash
# Apply Naveen's keyboard shortcuts to current user
TARGET_DIR="${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml"
mkdir -p "$TARGET_DIR"

if [ -f "$TARGET_DIR/xfce4-keyboard-shortcuts.xml" ]; then
    cp "$TARGET_DIR/xfce4-keyboard-shortcuts.xml" "$TARGET_DIR/xfce4-keyboard-shortcuts.xml.bak"
    echo ":: Backed up existing shortcuts to .bak"
fi

cp /usr/share/naveen-customization/xfce4-keyboard-shortcuts.xml "$TARGET_DIR/"
echo ":: Applied Naveen-Arch keyboard shortcuts. You may need to logout or restart xfconfd."
