#!/bin/sh

sudo cp ./jenkins.list /etc/apt/sources.list.d
wget -q -O - http://pkg.jenkins-ci.org/debian/jenkins-ci.org.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install jenkins
