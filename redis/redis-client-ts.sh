#!/bin/sh
LOCAL_CONTAINER_NAME="redis-lab-ts"
DOCKER_IMAGE_NAME="redis"
# DOCKER_IMAGE_NAME_CLIENT="redis"
LOCAL_CONTAINER_PORT=6379
# sudo docker run --interactive --tty --rm --link redis-lab:redis   redis   redis-cli -h redis -p 6379
sudo docker run --rm --interactive --tty --rm --link $LOCAL_CONTAINER_NAME:$DOCKER_IMAGE_NAME $DOCKER_IMAGE_NAME redis-cli -h $LOCAL_CONTAINER_NAME -p $LOCAL_CONTAINER_PORT
