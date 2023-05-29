# docker images and docker-compose solutions
set of docker images for general purposes

for using predefined scripts in documentation properties
update your ".bashrc" with next aliases   
( or just update destination session )
```sh
export ROOT_DOCKER_IMAGES="/home/projects/docker-images"
```

## Similar source of information:
* [docker compose for diff stack](https://github.com/docker/awesome-compose)  
* [bitnami collection](https://github.com/bitnami)

## [docker hub](https://hub.docker.com/search?q=&type=image)  
search in docker hub for a 'ssh'  
```sh
SEARCH_CRITERIA=ssh
docker search $SEARCH_CRITERIA
docker search --filter=stars=3 --no-trunc $SEARCH_CRITERIA
docker search --format "{{.Name}}: {{.StarCount}}" $SEARCH_CRITERIA
```
