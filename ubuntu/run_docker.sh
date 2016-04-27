#!/usr/bin/env bash



mkdir -p $HOME/.jenkins_home
docker run --name primero -p 8080:8080 -p 50000:50000 -v $HOME/.jenkins_home:/var/jenkins_home sjyuan/jenkins
