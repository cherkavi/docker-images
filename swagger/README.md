## run editor
```sh
docker pull swaggerapi/swagger-editor
docker run -d -p 8090:8080 swaggerapi/swagger-editor
```

## [run codegenerator](https://github.com/swagger-api/swagger-codegen)
```sh
# clone prepared docker image
docker pull swaggerapi/swagger-codegen-cli

# run with help command
docker run -it swaggerapi/swagger-codegen-cli config-help -l python

LOCAL_FOLDER_RESULT="~/temp/swagger-generated"
CONTAINER_FOLDER_RESULT="/swagger-api/out"
SUB_FOLDER_RESULT="result"

LOCAL_FOLDER_SOURCE="~/temp/swagger-definitions"
CONTAINER_FOLDER_SOURCE="/swagger-api/yaml"
SOURCE_FILE="twitter.yaml"

docker run -it \
    -v $LOCAL_FOLDER_SOURCE:$CONTAINER_FOLDER_SOURCE \
    -v $LOCAL_FOLDER_RESULT:$CONTAINER_FOLDER_RESULT \
    swaggerapi/swagger-codegen-cli generate \
    -i $CONTAINER_FOLDER_SOURCE/$SOURCE_FILE \
    -l csharp \
    -o $CONTAINER_FOLDER_RESULT/$SUB_FOLDER_RESULT
```
