tag:tool  
tag:batch  

## [documentation](https://airflow.readthedocs.io/en/latest/index.html)  

[source code](https://github.com/puckel/docker-airflow)  
[my source code ](https://github.com/cherkavi/python-utilities/tree/master/airflow)  

```sh
git clone https://github.com/puckel/docker-airflow.git
```
manual build container in case of changes in airflow.cfg
```sh
docker build --tag puckel/docker-airflow:1.10.9 -f docker-airflow/Dockerfile
```

```sh
# start: database init, airflow scheduler, airflow webserver
docker-compose -f docker-airflow/docker-compose-LocalExecutor.yml up -d
```

```sh
x-www-browser http://localhost:8080/admin/
```

```sh
# folder with DAGs ( small examples also there )
cd docker-airflow/dags

#        !!! switch DAG ON !!! after execution 
```

```sh
# connect to working airflow
docker exec -it docker-airflow_webserver_1 /bin/bash

# check log of DAG
vim ~/logs/scheduler/latest/hello_world.py.log

# interact with airflow
export AIRFLOW__CORE__SQL_ALCHEMY_CONN=postgresql+psycopg2://airflow:airflow@postgres:5432/airflow
```

```sh
# connect to working airflow
docker exec -it docker-airflow_webserver_1 sh -c "/entrypoint.sh /bin/bash"
# get connections
airflow connections --list
```

```sh
airflow list_dags
airflow trigger_dag -c '{"p1":113}' test1
```

## create polygon for source code
```sh
# install module
pip3 install virtualenv

# create env variable
python3 -m virtualenv venv

# activate
source venv/bin/activate

# install airflow 
pip3 install apache-airflow

# exit from virtual environment
deactivate
```

## some sql collaboration 
Admin->Connections->"postgres_default"
```properties
conn Id=postgres_default
Conn Type=Postgres
Host=postgres
Schema=airflow
Login=airflow
Password=airflow
```
Data Profiling->Ad Hoc Query->postgres_default


```sql
-- all tables from schema
select * from information_schema.tables
where table_schema = 'public'

-- print schema of certain table
select column_name, data_type, character_maximum_length
from INFORMATION_SCHEMA.COLUMNS where table_name = 'task_instance';

-- print all success instances
select * from task_instance where state in ('success')
select * from dag_run

-- select encode(executor_config, 'escape') from task_instance
```


## configuration examples
```
sql_alchemy_pool_size = 5
AIRFLOW__CORE__SQL_ALCHEMY_POOL_SIZE
```
