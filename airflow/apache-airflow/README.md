start 
```sh
docker-compose -f docker-compose-LocalExecutor.yml up --build -d
docker-compose -f docker-compose-LocalExecutor.yml down
```

manual start
```sh
docker run --entrypoint="" --interactive --tty apache/airflow:1.10.10-python3.7  /bin/sh 
```
