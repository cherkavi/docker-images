# Kafka tools
## start in docker container
```sh
docker-compose up -d
# docker-compose down
docker ps
```
## open UI for managing kafka
```sh
x-www-browser http://localhost:9021/
```

## commands 
```sh
# list of the topics
docker exec broker kafka-topics --list --bootstrap-server localhost:9092 | grep ^topic

# create topic 
docker exec broker kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic topic.1
docker exec broker kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic topic.2
docker exec broker kafka-topics --create --bootstrap-server localhost:9092 --replication-factor 1 --partitions 1 --topic topic.3
```
