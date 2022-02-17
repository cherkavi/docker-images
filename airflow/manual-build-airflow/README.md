## build the image 
or when you are changing config file
```sh
docker build . -t airflow_custom
```

## start image in manual mode
```sh
docker rm airflow_custom_local
docker run --entrypoint="" --name airflow_custom_local --interactive --tty --publish 8080:8080 --volume `pwd`/logs:/opt/airflow/logs --volume `pwd`/dags:/opt/airflow/dags airflow_custom /bin/sh 

/opt/airflow/entrypoint.sh
```
## open Airflow UI 
```sh
x-www-browser http://localhost:8080
# username: vitalii 
# password: vitalii 
```
## connect to running container
```sh
docker exec  --interactive --tty airflow_custom_local /bin/bash
```

## REST api call
```sh
AIRFLOW_URL="http://localhost:8080"
DAG_NAME="data_api_call"
DAG_RUN_ID="manual_data_api_call_"`date +%Y-%m-%d-%H:%M:%S:%s`
AIRFLOW_USER=vitalii
AIRFLOW_PASSWORD=vitalii

ENDPOINT="$AIRFLOW_URL/api/v1/dags/$DAG_NAME/dagRuns"
# BODY="{\"conf\":{\"account_id\":\"$ACCOUNT_ID\",\"filename\":\"$1\"},\"dag_run_id\":\"$DAG_RUN_ID\"}"
BODY="{\"conf\":{},\"dag_run_id\":\"$DAG_RUN_ID\"}"
curl -H "Content-Type: application/json" --data-binary $BODY -u $AIRFLOW_USER:$AIRFLOW_PASSWORD -X POST $ENDPOINT	
```

##  print output logs
```sh
docker logs --since 42m airflow_custom_local
```

## start the image
```sh
docker run --rm --name airflow_custom_local -p 8080:8080 airflow_custom
```


cd airflow-env
find . | grep airflow | grep auth


ubuntu:20.04
docker exec -it airflow_webserver /bin/bash 

docker ps



# build container 

enable_experimental_api = True
# How to authenticate users of the API
airflow[password]
authenticate = False



