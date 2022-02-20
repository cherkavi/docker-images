### connection 
#   Conn id: data_api_connection
# Conn Type: HTTP
#      Host: https://data-portal.devops.org
#     Extra: { "Content-Type": "application/json", "Cookie": "kc-access=eyJhbGci...."}

from datetime import timedelta, datetime

import os
from typing import Dict
from airflow.models import DAG
from airflow.operators.http_operator import SimpleHttpOperator
from airflow.operators.python import PythonOperator
from airflow.models.skipmixin import SkipMixin
import logging
import json

DAG_NAME = "data_api_call"
TASK_DATA_API_CALL = "data_api_call"
CONNECTION_ID = "data_api_connection"

def print_conf(**context):
    print(context)
    account_id=context["dag_run"].conf['account_id']
    print(f"account_id {account_id}")
    filename=context["dag_run"].conf['filename']
    print(f"filename {filename}")

# alternative way of reading input parameters
request_account="{{ dag_run.conf['account_id']  }}"

with DAG(DAG_NAME,
         description='collaboration with data api',
         schedule_interval=None,
         start_date=datetime(2018, 11, 1),
         catchup=False) as dag:

    def print_input_parameters():
        return PythonOperator(task_id="print_input_variables", python_callable=print_conf, provide_context=True)

    def data_api_call(connection_id=CONNECTION_ID):
        return SimpleHttpOperator(
            task_id=TASK_DATA_API_CALL
            , http_conn_id=CONNECTION_ID
            , method="GET"
            , endpoint=f"/session-lister/v1/version?{request_account}"
            # data="{\"id\":111333222}"
            # response will be pushed to xcom with COLLABORATION_TASK_ID
            # , xcom_push=True
            , log_response=True
            , extra_options={"verify": False, "cert": None}
        )

    print_input_parameters() >> data_api_call()
