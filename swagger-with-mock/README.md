# Swagger component
[how to use swagger](https://swagger.io/tools/open-source/getting-started/)

## Designer API + UI Developer
```bash
# move into subfolder 
cd collaboration
# start both containers
docker-compose up
# stop both containers
docker-compose down
```

## Designer API
```bash
# start swagger editor locally
docker run -d -p 8090:8080 swaggerapi/swagger-editor
x-www-browser http://localhost:8090/
# File-> Import File
```


## UI Developer
```bash
# change path according your local repo
PATH_TO_HLM_REPO="/home/projects/law-marketing/hlm-mono-repo"
# start new 
docker run --init --rm -it \
    -p 4010:4010 \
    -v $PATH_TO_HLM_REPO/collaboration/dashboard.yaml:/app/config.yaml \
    stoplight/prism \
    mock --dynamic --host 0.0.0.0 /app/config.yaml
```


example of execution with current (cant be changed in future) mock
```bash
curl -X GET http://localhost:4010/user/nisi
```