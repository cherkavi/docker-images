# Apache 

## links
* [alternative solution: file server, http server for folder, local server](https://github.com/cherkavi/python-utilities/blob/master/http/http-server-start.md)

* `npm install --global http-server; http-server --port 9090`

## start apache and point out to current folder
### create index file
```sh
vim index.html
```
### start container
```bash
## start console of the container
docker run --name apache --rm -v $(pwd):/app -p 9090:8080 -it bitnami/apache:latest sh
# cat /opt/bitnami/apache/conf/httpd.conf

## start apache on port 9090
docker rm apache
docker run --name apache --rm -v $(pwd):/app -p 9090:8080 bitnami/apache:latest

## start with custom config file
# start in deamon mode: docker run -d -p 9090:8080 -v $(pwd)/apache-proxy.config:/opt/bitnami/apache/conf/httpd.conf bitnami/apache:latest
docker run -p 9090:8080 -v $(pwd)/apache-proxy.config:/opt/bitnami/apache/conf/httpd.conf bitnami/apache:latest
```

manual steps for debugging purposes
```sh
# Load libraries
. /opt/bitnami/scripts/libapache.sh
. /opt/bitnami/scripts/libos.sh
. /opt/bitnami/scripts/liblog.sh
# Load Apache environment variables
. /opt/bitnami/scripts/apache-env.sh

"${APACHE_BIN_DIR}/httpd" -f "$APACHE_CONF_FILE"
# "${APACHE_BIN_DIR}/httpd" -f "$APACHE_CONF_FILE" -D "FOREGROUND"
```

```bash
x-www-browser localhost:9090
```
