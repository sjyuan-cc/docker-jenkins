#!/usr/bin/env bash


export CONTAINER_RANCHER_SERVER=rancher-server

docker ps -a | grep $CONTAINER_RANCHER_SERVER | awk '{print $1}' | xargs --no-run-if-empty docker rm -f
docker run -d --name $CONTAINER_RANCHER_SERVER --restart=always -p 8000:8080 rancher/server