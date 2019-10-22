#!/bin/sh

LOCAL_CONTAINER_NAME="redis-lab-ts"
LOCAL_CONTAINER_PORT=6379
IMAGE_DATA=`pwd dirname $0`"/data-ts"
DOCKER_IMAGE_NAME="redislabs/redistimeseries"

started_container=`docker ps -a --filter "name=^$LOCAL_CONTAINER_NAME$" --format "{{.Names}}"`
if [ -z "$started_container" ]
then
    #
    # https://hub.docker.com/_/redis
    #
    # start redis with persistent storage
    # with persistent volume
    # ```
    sudo docker run --publish $LOCAL_CONTAINER_PORT:6379 --volume $IMAGE_DATA:/data --name $LOCAL_CONTAINER_NAME --detach $DOCKER_IMAGE_NAME redis-server --appendonly yes --loadmodule /usr/lib/redis/modules/redistimeseries.so
    # ```
    # start without persistence
    # sudo docker run --publish 6379:6379 --name $LOCAL_CONTAINER_NAME --detach $DOCKER_IMAGE_NAME
else
    sudo docker start $LOCAL_CONTAINER_NAME
    sleep 2
    docker ps  
fi
