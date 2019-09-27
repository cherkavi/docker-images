#!/bin/sh
sudo docker run --interactive --tty  --name redis-lab-cli  --link redis-lab:redis   redis   redis-cli -h redis -p 6379