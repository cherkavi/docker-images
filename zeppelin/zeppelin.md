
# [tags for usage](https://hub.docker.com/r/apache/zeppelin/tags)
# ./logs
# ./notebook
```sh
docker run -rm -name zeppelin \
-p 8080:8080 \
-v $PWD/logs:/logs \
-e ZEPPELIN_LOG_DIR="/logs" \
-v $PWD/notebook:/notebook \
-e ZEPPELIN_NOTEBOOK_DIR="/notebook" \
 apache/zeppelin:0.8.2
```
