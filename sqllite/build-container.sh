#!/usr/bin/bash
container_name=${1:-"sqlite"}  
docker build --tag $container_name .