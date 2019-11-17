# https://grafana.com/docs/installation/docker/
#
docker run --rm \
        --publish 9091:3000 \
	--env GF_SECURITY_ADMIN_PASSWORD=admin \
	--volume `pwd dirname $0`/config:/etc/grafana/provisioning \
        --volume `pwd dirname $0`/data:/var/lib/grafana \
	--name grafana \
	--link prometheus:prometheus-host \
	grafana/grafana 
