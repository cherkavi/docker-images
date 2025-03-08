# Elastic Search
## links
* [docker hub of elastic](https://hub.docker.com/_/elasticsearch/)
* [elastic docker](https://www.elastic.co/guide/en/elasticsearch/reference/current/docker.html)

## start
```sh
docker-compose up
# docker-compose down
x-www-browser http://localhost:5601
```

## activation
### Enrollment token
```sh
# kibana
docker exec -it elastic-search_elasticsearch_1 /bin/sh
bin/elasticsearch-create-enrollment-token --scope kibana
```

### Kibana verification
```sh
docker exec -it elastic-search_kibana_1 /bin/sh
bin/kibana-verification-code
```
