to start apache server and point out to current folder
```bash

# list of ports with
# -p 9443:8443 \
# -p 9090:8080 \
docker rm apache
docker run --name apache --rm -v $(pwd):/app -p 9090:8080 bitnami/apache:latest
```

```
vim index.html
```

```bash
x-www-browser localhost:9090
```
