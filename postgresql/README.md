tag:datastorage  
tag:database  
tag:rdbms  

## postgresql 
docker-compose.yaml file
```yaml
version: "3"
services:
  database:
    image: "postgres"
    environment:
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=glee
    ports:
      - "5532:5432"
```

## Issues:

### permanent storage
issue after attempt to start 
```
EPERM: operation not permitted, utime '/bitnami/postgresql/.restored'
```
solution
```bash
sudo chown -R 1001:1001 /path/to/postgre-vol
```
```yaml

    spec:
      securityContext:
        fsGroup: 1001
        runAsUser: 1001
      nodeSelector:
        kubernetes.io/hostname: gtmachine03
      containers:
      - name: colosseum-postgres
        image: docker.io/bitnami/postgresql:10.6.0

```
