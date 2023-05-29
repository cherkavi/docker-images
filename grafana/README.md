tag:tool  
tag:dashboard  

# Grafana
## [grafana installation](https://grafana.com/docs/installation/docker/)
```sh

# --link prometheus:prometheus \
docker run --rm \
    --publish 9091:3000 \
    --env GF_SECURITY_ADMIN_PASSWORD=admin \
    --volume `pwd dirname $0`/config:/etc/grafana/provisioning \
    --volume `pwd dirname $0`/data:/var/lib/grafana \
    --name grafana \
    grafana/grafana 
```