#!/bin/sh

echo "deb http://ftp.us.debian.org/debian/ wheezy contrib" > /tmp/contrib.list
sudo mv /tmp/contrib.list /etc/apt/sources.list.d/

sudo apt-get update
sudo apt-get install flashplugin-nonfree
sudo update-flashplugin-nonfree --install
