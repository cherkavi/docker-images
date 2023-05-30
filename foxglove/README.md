# [Foxglove](https://foxglove.dev/)

* [foxglove Dockerfile](https://github.com/foxglove/studio/blob/main/Dockerfile): 
* [foxglove Docker container](https://github.com/foxglove/studio/pkgs/container/studio)

## run foxglove 
### default run 
```sh
docker run --rm -p "8080:8080" ghcr.io/foxglove/studio:latest
```
### custom run 
```sh
docker run --rm -p "8080:8080" --entrypoint="" -it ghcr.io/foxglove/studio:latest /bin/sh
caddy file-server --listen :8080
```
