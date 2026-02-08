#!/bin/bash
# Naveen's Repo CI/CD Script
REPO_NAME="naveen_repo"
REPO_DIR="$(pwd)/x86_64"
PKG_DIR="$(pwd)/PKGBUILDs/naveen-customization"

echo ":: Building naveen-customization..."
cd "$PKG_DIR" || exit
makepkg -sf --noconfirm

echo ":: Moving binaries to repo..."
mv *.pkg.tar.zst "$REPO_DIR/"

echo ":: Updating repository database..."
cd "$REPO_DIR" || exit
repo-add "$REPO_NAME.db.tar.gz" *.pkg.tar.zst

echo ":: Done. Ready to push to GitHub."
