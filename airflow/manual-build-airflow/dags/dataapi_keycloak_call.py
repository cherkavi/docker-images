### connection 
#   Conn id: data_api_connection
# Conn Type: HTTP
#      Host: https://data-portal.devops.org
#     Extra: { "Content-Type": "application/json", "Cookie": "kc-access=eyJhbGci...."}

from datetime import timedelta, datetime
from venv import create
import requests

import os
from typing import Dict
import json
from airflow import AirflowException
from airflow.models import DAG
from airflow.operators.http_operator import SimpleHttpOperator
from airflow.operators.python import PythonOperator
from airflow.hooks.base_hook import BaseHook
from airflow.models.skipmixin import SkipMixin
import logging
import json

DAG_NAME = "keycloak_dataapi_call"
TASK_DATA_API_CALL = "data_api_call"
CONNECTION_ID_KEY_CLOAK = "key_cloak"
CONNECTION_ID_DATA_API = "data_api_connection"

def print_conf(**context):
    print(context)
    # account_id=context["dag_run"].conf['account_id']
    # print(f"account_id {account_id}")

# alternative way of reading input parameters
# request_account="{{ dag_run.conf['account_id']  }}"


def obtain_keycloak_token() -> str:
    """
    get authentication token from KeyCloak: 
    :return : authentication token 
    """
    conn = BaseHook.get_connection(CONNECTION_ID_KEY_CLOAK)
    keycloak_url = f"{conn.schema}://{conn.host}:{conn.port}/auth/realms/advantage/protocol/openid-connect/token"
    headers = {"Content-Type": "application/x-www-form-urlencoded"}

    payload=dict()
    payload["username"]=conn.login
    payload["password"]=conn.password
    payload["grant_type"]="password"
    payload["client_id"]="data-portal-production" # don't change it for PROD
    try:
        r = requests.post(keycloak_url, headers=headers, data=payload)
        return r.json()["access_token"]
    finally:
        if r:
            r.close()

def get_session_by_id(session_id:str = "cc17d9f8-0f96-43e0-a0dc-017c4ffc63ec"):
    """
    call data api 
    """
    connection_data_api = BaseHook.get_connection(CONNECTION_ID_DATA_API)    
    url: str = f"{connection_data_api.host}/session-lister/v1/sessions/{session_id}"
    headers = { "Authorization": f"Bearer {obtain_keycloak_token()}" }
    try:
        r = requests.get(url, headers=headers)
        return r.json()
    finally:
        if r:
            r.close()

def create_marker(**context): 
    """
    create marker via data-api endpoint
    """
    request_body=json.dumps(context["dag_run"].conf['request_body'])    
    print(f"request body: {request_body}")
    connection_data_api = BaseHook.get_connection(CONNECTION_ID_DATA_API)    
    url: str = f"{connection_data_api.host}/marker/v1/markers"
    headers = { "Authorization": f"Bearer {obtain_keycloak_token()}", "accept": "application/json", "Content-Type": "application/json"}
    try:
        r = requests.post(url, headers=headers, data=request_body)
        if not (200 <= r.status_code <300):
            raise AirflowException(f"data api wrong response: {r.text}")
        return r.json()
    finally:
        if r:
            r.close()


with DAG(DAG_NAME,
         description='collaboration with data api',
         schedule_interval=None,
         start_date=datetime(2018, 11, 1),
         catchup=False) as dag:

    def print_input_parameters():
        return PythonOperator(task_id="print_input_variables", python_callable=print_conf, provide_context=True)

    def data_api_call(connection_id=CONNECTION_ID_DATA_API):        
        # return PythonOperator(task_id=TASK_DATA_API_CALL, python_callable=get_session_by_id, provide_context=True)
        return PythonOperator(task_id=TASK_DATA_API_CALL, python_callable=create_marker, provide_context=True)

    print_input_parameters() >> data_api_call()
