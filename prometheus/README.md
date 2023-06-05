tag:tool  
tag:metrics  

# Prometheus
## Links
* [prometheus manual installation](https://codewizardly.com/prometheus-on-aws-ec2-part1/)
* [prometheus ecosystem download](https://prometheus.io/download/)
* [PromQL - prometheus queries](https://prometheus.io/docs/prometheus/latest/querying/examples/)

## prometheus run with embedded TSDB and custom configuration
```sh
mkdir data
chmod 777 data
echo "sometimes need to create ./data folder and give it full access 777 "

DOCKER_NAME=prometheus
docker rm $DOCKER_NAME
docker run \
        -p 9090:9090 \
	-v `pwd dirname $0`/config/prometheus-simple.yml:/etc/prometheus/prometheus.yml  \
	-v `pwd dirname $0`/data:/usr/local/var/prometheus:rw \
	--name $DOCKER_NAME \
	prom/prometheus \
	--config.file=/etc/prometheus/prometheus.yml \
	--storage.tsdb.path=/usr/local/var/prometheus

x-www-browser localhost:9090
```

## alerts + prometheus + grafana 
![architecture](https://github.com/cherkavi/docker-images/assets/8113355/2dd80a65-1400-44f1-8e58-5432bd9e55ab)
```sh
docker-compose -f docker-compose-prometheus-alerts-grafana.yaml up
# docker-compose -f docker-compose-prometheus-alerts-grafana.yaml down
```
### [Grafana](http://localhost:3000/) - admin/admin  
### [Prometheus](http://localhost:9090/)  
[configuration for prometheus](https://prometheus.io/docs/prometheus/latest/getting_started/)
```sh
prom/prometheus \
  --config.file=/etc/prometheus/prometheus.yml \
  --storage.tsdb.path=/usr/local/var/prometheus
```
### [AlertManager](http://localhost:9093/)  
```sh
./alertmanager --config.file=alertmanager.yml
```

## [prometheus node exporter](https://prometheus.io/docs/guides/node-exporter/)
prometheus is working in pull mode, that means 
observed system should emit http-endpoint on some port
```sh
docker run -d \
  --net="host" \
  --pid="host" \
  -v "/:/host:ro,rslave" \
  quay.io/prometheus/node-exporter:latest \
  --path.rootfs=/host
```
