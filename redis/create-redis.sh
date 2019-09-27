#!/bin/sh
sudo docker run --publish 6379:6379 --volume data:/data --name redis-lab --detach redis