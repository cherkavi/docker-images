#!/usr/bin/bash
# parameters: <path to db>
# example: ./run-container-db-path.sh messages.db
container_name="sqllite-browser"
x-www-browser http://localhost:9090 &
docker run --publish 9090:8080  --volume $1:/db/database.db $container_name
