#!/bin/sh

install_dir=~/.config/awesome

mkdir -p $(install_dir)

install --mode=644 rc.lua $(install_dir)/rc.lua
install --mode=644 notify.lua $(install_dir)/notify.lua
install --mode=644 lang.lua $(install_dir)/lang.lua
install --mode=644 settings.lua $(install_dir)/settings.lua
cp -Rf themes $(install_dir)
