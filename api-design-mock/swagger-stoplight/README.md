tag:code  
tag:tool  
tag:generator  

# [Swagger editor](https://swagger.io/)

## [open source tools](https://swagger.io/tools/open-source/)
## [run editor](https://github.com/swagger-api/swagger-editor)
```sh
docker pull swaggerapi/swagger-editor
docker run -d -p 8090:8080 swaggerapi/swagger-editor
```
swagger editor it is just a [JavaScript UI application](https://editor.swagger.io/)

## [alternative api online designer](https://stoplight.io/studio/)
## [alternative api online designer](https://www.apicur.io/)
```sh
git clone https://github.com/Apicurio/apicurio-studio.git
cd apicurio-studio/distro/docker-compose
cat Readme.md
```

## run mock
```sh
docker rm openapi-mock
docker run -it \
    --name=openapi-mock \
    -p 4010:4010 \
    -v $(pwd)/my-own-model.yaml:/app/config.yaml \
    stoplight/prism \
    mock --dynamic --host 0.0.0.0 /app/config.yaml
```


## [examples ready to be used](https://app.swaggerhub.com/)

## [run codegenerator](https://github.com/swagger-api/swagger-codegen)
### documentation
* https://openapi-generator.tech/docs/customization.html
* https://github.com/swagger-api/swagger-codegen/blob/master/README.md
* https://github.com/swagger-api/swagger-codegen/wiki/Server-stub-generator-HOWTO
* https://github.com/swagger-api/swagger-codegen/wiki/API-client-generator-HOWTO


### "nacked" run with [generated jar](https://swagger.io/docs/open-source-tools/swagger-codegen/)
```sh
java -jar swagger-codegen-cli-2.2.1.jar help
java -jar swagger-codegen-cli-2.2.1.jar help generate
java -jar swagger-codegen-cli-2.2.1.jar langs
java -jar swagger-codegen-cli-2.2.1.jar config-help -l python-flask
java -jar swagger-codegen-cli-2.2.1.jar generate -h
java -jar -DdebugOperations swagger-codegen-cli-2.2.1.jar generate -h


java -jar -DdebugOperations swagger-codegen-cli-2.2.1.jar generate \
--input-spec gateway/api/api.swagger.yml \
--ignore-file-override=/path/to/ignore_file_list
--lang python-flask --output /home/projects/temp/swagger  -DmodelTests=false -D apiTests=false -DmodelDocs=false -D supportPython2=false

# !!!IMPORTANT!!!
# --ignore-file-override=/path/to/ignore_file_list
# not working properly with version 2.4.9 - use only .swagger-codegen-ignore in destination folder
```

### additional flags 
* DdebugSwagger prints the OpenAPI Specification as interpreted by the codegen
* DdebugModels prints models passed to the template engine
* DdebugOperations prints operations passed to the template engine
* DdebugSupportingFiles prints additional data passed to the template engine
* DbrowserClient=false 
* DpubName=swagger_vm 
* DhideGenerationTimestamp=true 
* DbrowserClient=false 


### docker container
```sh
# pull prepared docker image
docker pull swaggerapi/swagger-codegen-cli

# run with help command
docker run -it swaggerapi/swagger-codegen-cli config-help -l python

LOCAL_FOLDER_RESULT="/home/projects/temp/"
CONTAINER_FOLDER_RESULT="/swagger-api/out"
SUB_FOLDER_RESULT="swagger-generated"

LOCAL_FOLDER_SOURCE="/apps/tsa/gateway/api"
CONTAINER_FOLDER_SOURCE="/swagger-api/yaml"
SOURCE_FILE="api.swagger.yml"

docker run -it \
    -v $LOCAL_FOLDER_SOURCE:$CONTAINER_FOLDER_SOURCE \
    -v $LOCAL_FOLDER_RESULT:$CONTAINER_FOLDER_RESULT \
    swaggerapi/swagger-codegen-cli generate \
    -i $CONTAINER_FOLDER_SOURCE/$SOURCE_FILE \
    -l csharp \
    -o $CONTAINER_FOLDER_RESULT/$SUB_FOLDER_RESULT

# run without entry point
# docker run --entrypoint="" --interactive --tty swaggerapi/swagger-codegen-cli  /bin/sh

# files inside container
# /opt/swagger-codegen-cli/swagger-codegen-cli.jar 
# /usr/lib/jvm/java-1.8-openjdk/jre/bin/java
# /usr/lib/jvm/java-1.8-openjdk/bin/java
```


