# nginx server

## run nginx within docker container
```sh
CONTAINER_NAME=local-ngnix-server
docker rm $CONTAINER_NAME

# -v $(pwd)/my-local-server.conf:/etc/nginx/conf.d/my-local-server.conf:ro  \
docker run --name $CONTAINER_NAME \
  -p 9090:8080 \
  -v $(pwd)/nginx.conf:/etc/nginx/conf.d/default.conf:ro  \
  -v $(pwd):/mapped-root:rw  \
  nginx:latest

```
### run without start point
```sh
docker run --entrypoint="" -it nginx:latest /bin/sh 
```

### connect to running container
```sh
CONTAINER_NAME=local-ngnix-server
docker exec  -it $CONTAINER_NAME /bin/bash
# inside continaer
ls -la /var/log/nginx/access.log
cat /var/log/nginx/access-file.log
cat /var/log/nginx/error-file.log
```

### access nginx
```sh
x-www-browser http://localhost:9090
curl http://localhost:9090/nginx.conf
```
