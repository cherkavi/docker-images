## build the image 
or when you are changing config file
```sh
docker build . -t airflow_custom
```

## start airflow
```sh
docker rm airflow_custom_local
docker run --name airflow_custom_local --publish 8080:8080 --volume `pwd`/logs:/opt/airflow/logs --volume `pwd`/dags:/opt/airflow/dags airflow_custom

# manual start 
# docker run --entrypoint="" --name airflow_custom_local --interactive --tty --publish 8080:8080 --volume `pwd`/logs:/opt/airflow/logs --volume `pwd`/dags:/opt/airflow/dags airflow_custom /bin/sh 
# /opt/airflow/entrypoint.sh
```

# start existing container 
```sh
docker start airflow_custom_local
docker exec  --interactive --tty airflow_custom_local /bin/bash
```

# stop existing container 
```sh
docker stop airflow_custom_local
docker start airflow_custom_local
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
# DAG_NAME="data_api_call"
DAG_NAME="keycloak_dataapi_call"
AIRFLOW_USER=vitalii
AIRFLOW_PASSWORD=vitalii

ENDPOINT="$AIRFLOW_URL/api/v1/dags/$DAG_NAME/dagRuns"
## empty body
# BODY="{\"conf\":{},\"dag_run_id\":\"$DAG_RUN_ID\"}"
## body with parameters
# ACCOUNT_ID=1012;FILENAME=some/path/to/file
# BODY="{\"conf\":{\"account_id\":\"$ACCOUNT_ID\",\"filename\":\"$1\"},\"dag_run_id\":\"$DAG_RUN_ID\"}"

DAG_RUN_ID="manual_data_api_call_"`date +%Y-%m-%d-%H:%M:%S:%s`; echo $DAG_RUN_ID

curl -H "Content-Type: application/json" --data-binary @request-example.json -u $AIRFLOW_USER:$AIRFLOW_PASSWORD -X POST $ENDPOINT	
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



