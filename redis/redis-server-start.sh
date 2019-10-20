#!/bin/sh

started_container=`docker ps -a --filter "name=redis-lab" --format "{{.Names}}"`
if [ -z "$started_container" ]
then
    #
    # https://hub.docker.com/_/redis
    #
    # start redis with persistent storage
    # with persistent volume
    # ```
    sudo docker run --publish 6379:6379 --volume `pwd dirname $0`/data:/data --name redis-lab --detach redis redis-server --appendonly yes
    # ```
    # 
    # start without persistence
    # sudo docker run --publish 6379:6379 --name redis-lab --detach redis
else
    sudo docker start redis-lab
    sleep 2
    docker ps  
fi
