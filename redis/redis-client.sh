#!/bin/sh
sudo docker run --rm --interactive --tty --rm --link redis-lab:redis   redis   redis-cli -h redis -p 6379
