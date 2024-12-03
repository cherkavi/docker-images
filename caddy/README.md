# [caddy](https://registry.hub.docker.com/_/caddy)
> web server
## examples/links
* https://caddyserver.com/docs/caddyfile-tutorial
* https://www.howtogeek.com/devops/how-to-deploy-a-caddy-web-server-with-docker/

## [start it locally](https://caddyserver.com/docs/command-line)
```sh
docker pull caddy

docker run --publish 9090:8080 caddy
docker run --publish 9090:8080 -v `pwd`:/localdata caddy caddy file-server --root /localdata --browse --listen :8080
```
run caddy with complex config file
```sh
docker run --publish 9090:8080 -v `pwd`:/localdata -v `pwd`/caddy.conf:/etc/caddy/Caddyfile caddy
## entry point will be:
# caddy run --config /etc/caddy/Caddyfile --adapter caddyfile
```

run caddy with cors
```sh
docker run --publish 9090:8080 -v `pwd`:/localdata -v `pwd`/caddy-cors.conf:/etc/caddy/Caddyfile caddy
```

## caddy hash password
```sh
docker run --rm caddy caddy hash-password --plaintext my_secret_password
```
