echo "sometimes need to create ./data folder and give it full access 777 "
docker run --rm \
        -p 9090:9090 \
	-v `pwd dirname $0`/config:/etc/prometheus  \
	-v `pwd dirname $0`/data:/usr/local/var/prometheus \
	--name prometheus \
	prom/prometheus \
	--config.file=/etc/prometheus/prometheus.yml \
	--storage.tsdb.path=/usr/local/var/prometheus
