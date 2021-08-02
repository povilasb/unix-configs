"""
When Fedora install from minimal network install, use this script to bring
the system up to a working state.

Prerequisites:
```bash
    $ dnf install xonsh
```
"""

fedora_pkgs = {
    "cli": ["neovim", "alacritty", "ripgrep", "tmux"],
    "gui": ["qtile", "@base-x", "gdk-pixbuf2", "firefox"],
    "develop": ["python3-devel", "git", "tig", "openssl-devel"],
    "audio": ["pulseaudio", "pulseaudio-module-x11", "pavucontrol"],
    "network": [
        "wireshark-cli",  # provides 'tshark'
    ],
    "file_systems": ["fuse-exfat", "exfat-utils"],
}

qtile_py_pkgs = ["psutil", "keyring", "xdg"]

sudo dnf install @(' '.join(sum(fedora_pkgs.values(), [])))
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# rpmfusion.org provides extra packages that Fedora project won't ship.
yum localinstall --nogpgcheck http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
