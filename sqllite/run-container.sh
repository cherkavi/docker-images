#!/usr/bin/bash
container_name=${1:-"sqlite"}  
x-www-browser http://localhost:9090 &
docker run --publish 9090:8080  --volume $(pwd)/db:/db $container_name
