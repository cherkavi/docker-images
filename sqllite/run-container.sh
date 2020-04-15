#!/usr/bin/bash
container_name=${1:-"sqlite"}  
docker run --publish 9090:8080  --volume $(pwd)/db:/db $container_name