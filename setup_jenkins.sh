#!/usr/bin/env bash

docker build -t primero/jenkins .

JENKINS_HOME=/var/jenkins_home

echo $JENKINS_HOME

docker rm -f primero-ci
docker run --name primero-ci -u root \
-p 8080:8080 \
-v $JENKINS_HOME:$JENKINS_HOME \
-v /var/run/docker.sock:/var/run/docker.sock:ro \
primero/jenkins
