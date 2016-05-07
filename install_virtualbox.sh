#! /bin/bash

wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -

echo "deb http://download.virtualbox.org/virtualbox/debian jessie contrib" > \
	/etc/apt/sources.list.d/virtualbox.list

apt-get update
apt-get install virtualbox-5.0 dkms
