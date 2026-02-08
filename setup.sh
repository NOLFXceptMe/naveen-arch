#!/bin/bash
# Naveen-Arch Bootstrapper
set -e

REPO_NAME="naveen_repo"
REPO_URL="https://NOLFXceptMe.github.io/naveen-arch"

echo ":: Initializing Naveen-Arch Setup..."

# 1. Add the custom repository to pacman.conf
if ! grep -q "\[$REPO_NAME\]" /etc/pacman.conf; then
    echo ":: Adding [naveen_repo] to /etc/pacman.conf"
    sudo bash -c "cat >> /etc/pacman.conf <<EOF

[$REPO_NAME]
SigLevel = Optional TrustAll
Server = $REPO_URL
EOF"
else
    echo ":: Repository already exists in pacman.conf"
fi

# 2. Sync and install the customization package
echo ":: Synchronizing databases and installing naveen-customization..."
sudo pacman -Syu --noconfirm naveen-customization

# 3. Final instruction for the user
echo " "
echo ":: SUCCESS: Naveen-Arch configuration is active."
echo ":: Note: If you just installed linux-zen, remember to update your bootloader!"
