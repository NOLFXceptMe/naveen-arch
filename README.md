### Why?
EndeavourOS (and Arch) don't have good enough defaults. This is my attempt at getting my system buttery smooth. 

1. Since user experience is more important that performance fairness on all applications, this package
    a. Moves to linux-zen which detects and prioritizes "interactive" processes
    b. Renice window manager to give it higher priority 

2. Sets "my" mouse lag to as low as possible by increasing power level on USB ports to max and never letting them auto switch-off. Based on my calculations, this will result in 4.38 kWh extra power consumption per year (In PNW, this is an extra $0.65 USD per year, at $0.15/kWh)

3. **Sane Keyboard Shortcuts:** Updates XFCE/XFWM4 defaults to better support tiling, workspace navigation, and common application launching (e.g., `<Ctrl> + Q` to close windows, `<Super> + Space` for Whisker Menu).

### Installation

```bash
curl -sL https://naveen.github.io/naveen-arch/setup.sh | bash
```

### Key Keyboard Shortcuts
The package installs system-wide defaults for XFCE. To apply them to your current profile, run `apply-shortcuts`.

- **Windows:** `<Ctrl> + Q` to close, `<Super> + Arrow Keys` to tile.
- **Apps:** `<Super> + Space` (Menu), `<Ctrl> + <Alt> + T` (Terminal), `<Super> + E` (Files).
- **Workspaces:** `<Ctrl> + <Alt> + Left/Right` to switch.

See [keyboard-shortcuts.md](keyboard-shortcuts.md) for the full list.

### Local Development & Testing

If you are making changes to the package and want to test them locally before pushing:

1. **Build the package:**
   ```bash
   ./update-repo.sh
   ```
   This script builds the `naveen-customization` package and updates the local repository database in the `x86_64/` directory.

2. **Install the local build:**
   ```bash
   sudo pacman -U x86_64/naveen-customization-*.pkg.tar.zst
   ```
   This command installs the locally built package directly, bypassing the remote repository.

*Note: Since `setup.sh` is designed to pull from the remote GitHub repository, running it will always attempt to sync with the version hosted online. Use the steps above to verify your local changes first.*
