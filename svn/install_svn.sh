#!/bin/sh

#
# Installs SVN 1.7.x to Debian wheezy.
#

wget -q -O - http://opensource.wandisco.com/wandisco-debian.gpg | sudo apt-key add -
sudo cp wandisco-subversion.list /etc/apt/sources.list.d/wandisco-subversion.list
sudo apt-get update
sudo apt-get install subversion subversion-tools
sudo rm /etc/apt/sources.list.d/wandisco-subversion.list
