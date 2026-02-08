#!/bin/bash
# Naveen's Repo CI/CD Script - V2 (Clean & Lean)
REPO_NAME="naveen_repo"
REPO_DIR="$(pwd)/x86_64"
PKG_DIR="$(pwd)/PKGBUILDs/naveen-customization"

echo ":: Cleaning old build artifacts..."
cd "$PKG_DIR" || exit
rm -rf src pkg *.pkg.tar.zst # Explicitly remove build junk

echo ":: Building naveen-customization..."
# -C cleans up the src/ and pkg/ folders after building
# --noprogressbar keeps logs clean for CI
makepkg -sfC --noconfirm

echo ":: Moving binaries to repo..."
mv *.pkg.tar.zst "$REPO_DIR/"

echo ":: Updating repository database..."
cd "$REPO_DIR" || exit
# repo-add doesn't have a 'clean' flag, so we manage it here
repo-add "$REPO_NAME.db.tar.gz" *.pkg.tar.zst

echo ":: Finalizing workspace..."
cd "$PKG_DIR"
rm -rf src pkg # Final safety wipe

echo ":: Done. Git status should now only show binary changes."
