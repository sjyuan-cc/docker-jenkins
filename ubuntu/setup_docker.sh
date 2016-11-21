#!/usr/bin/env bash

sudo apt-get install -y curl

sudo apt-get update
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo apt-add-repository 'deb https://apt.dockerproject.org/repo ubuntu-xenial main'

sudo apt-get update
apt-cache policy docker-engine
sudo apt-get install -y docker-engine

sudo usermod -aG docker $(whoami)

sudo touch /usr/local/bin/docker-compose
sudo chmod o+w /usr/local/bin/docker-compose

sudo curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod o-w /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose