#!/usr/bin/env bash

wget -q -O - http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key | sudo apt-key add -
sudo echo "deb http://pkg.jenkins-ci.org/debian-stable binary/" >> /etc/apt/sources.list

sudo apt-get update
sudo apt-get install jenkins
sudo service jenkins restart
