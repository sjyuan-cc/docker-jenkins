#!/usr/bin/env bash

export CONTAINER_REGISTRY_SERVER=registry-server

docker ps -a | grep $CONTAINER_REGISTRY_SERVER | awk '{print $1}' | xargs --no-run-if-empty docker rm -f

docker run -d --name $CONTAINER_REGISTRY_SERVER \
 --restart=always \
 -e REGISTRY_STORAGE_FILESYSTEM_ROOTDIRECTORY=/data \
 -v $HOME/.registry_home:/data \
 -p 5000:5000 \
 registry:2