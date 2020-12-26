mkdir -p ~/.config/qtile
cp config.py autostart.sh ~/.config/qtile


def from_src() -> None:
    sudo apt update
    sudo apt install libxcb-render0-dev libffi-dev libpangocairo-1.0-0 python3-venv python-dbus python-gobject
    mkdir -p ~/bin
    python3 -m venv ~/bin/qtile
    ~/bin/qtile/bin/pip3 install wheel xcffib cairocffi qtile
