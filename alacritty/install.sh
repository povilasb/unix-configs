#!/bin/sh

if [[ -z $@ ]] ; then
    src=alacritty.yml
else
    src=alacritty.$@.yml
fi

install -m 644 $src ~/.config/alacritty/alacritty.yml
