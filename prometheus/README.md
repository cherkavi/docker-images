tag:tool  
tag:metrics  

# Prometheus

## prometheus run with embedded TSDB and custom configuration
```sh
mkdir data
chmod 777 data
echo "sometimes need to create ./data folder and give it full access 777 "

DOCKER_NAME=prometheus
docker rm $DOCKER_NAME
docker run \
        -p 9090:9090 \
	-v `pwd dirname $0`/config/prometheus.yml:/etc/prometheus/prometheus.yml  \
	-v `pwd dirname $0`/data:/usr/local/var/prometheus:rw \
	--name $DOCKER_NAME \
	prom/prometheus \
	--config.file=/etc/prometheus/prometheus.yml \
	--storage.tsdb.path=/usr/local/var/prometheus

x-www-browser localhost:9090
```

## alerts + prometheus + grafana run 
part of the architecture:
![architecture](https://cdn.rawgit.com/prometheus/prometheus/e761f0d/documentation/images/architecture.svg)
```
```