# [caddy](https://registry.hub.docker.com/_/caddy)
> web server
## examples/links
* https://caddyserver.com/docs/caddyfile-tutorial
* https://www.howtogeek.com/devops/how-to-deploy-a-caddy-web-server-with-docker/

## [start it locally](https://caddyserver.com/docs/command-line)
```sh
docker pull caddy

sudo docker run --publish 9090:8080 caddy
sudo docker run --publish 9090:8080 -v `pwd`:/localdata caddy caddy file-server --root /localdata --browse --listen :8080
```
run caddy with complex config file
```sh
sudo docker run --publish 9090:8080 -v `pwd`:/localdata -v `pwd`/caddy.conf:/etc/caddy/Caddyfile caddy
```

run caddy with cors
```sh
sudo docker run --publish 9090:8080 -v `pwd`:/localdata -v `pwd`/caddy-cors.conf:/etc/caddy/Caddyfile caddy
```