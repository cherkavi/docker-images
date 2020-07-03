#!/usr/bin/bash
# parameters: <name of container> <path to db>
# example: ./run-container-db-path.sh messages messages.db
container_name=${1:-"sqlite"}  
x-www-browser http://localhost:9090 &
docker run --publish 9090:8080  --volume $2:/db/database.db $container_name
