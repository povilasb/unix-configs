sudo dpkg --add-architecture i386
sudo apt-get update

SKYPE_DEB=skype-debian_4.2.0.11-1_i386.deb
cd /tmp ; wget http://download.skype.com/linux/${SKYPE_DEB}
sudo dpkg -i /tmp/${SKYPE_DEB}
sudo apt-get install -f
