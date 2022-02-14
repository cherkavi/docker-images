"""
DAG file for auto labelling job.
"""

from datetime import timedelta, datetime

import os
from airflow.models import DAG
from airflow.contrib.operators.spark_submit_operator import SparkSubmitOperator
from airflow.operators.http_operator import SimpleHttpOperator
from airflow.operators.python_operator import BranchPythonOperator
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.operators.subdag_operator import SubDagOperator
from airflow.models.skipmixin import SkipMixin
import logging
import json

DEFAULT_DAG_VIEW = 'graph'
CONFIG_DIR = 'config'
CONFIG_FILE_NAME = 'dag_config.yaml'
FORK_LABEL_TASK_ID = 'fork_label_jobs'
SKIP_EXECUTION_TASK_ID = "skip_execution"
MAPRDB_REST_API_TASK_ID = "maprdb_restapi"
DAG_NAME = "autolabelling_example"
DAG_NAME_LABELING = "autolabelling_example_sub"


with DAG(DAG_NAME, description='First DAG', schedule_interval=None, start_date=datetime(2018, 11, 1), catchup=False) as dag:

    def is_standalone(**context):
        return DAG_NAME_LABELING        
        # return MAPRDB_REST_API_TASK_ID

    def gen2_or_gen1(**context):
        # return DAG_NAME_LABELING+"2"
        return SKIP_EXECUTION_TASK_ID

    is_standalone_execution = BranchPythonOperator(task_id = "is_standalone",python_callable = is_standalone,provide_context = True, dag=dag)
    gen_2_or_gen1 = BranchPythonOperator(task_id = "gen2_or_gen1",python_callable = gen2_or_gen1,provide_context = True, dag=dag)
    maprdb_read_session_metadata = DummyOperator(task_id=MAPRDB_REST_API_TASK_ID, dag=dag)
    skip_execution = DummyOperator(task_id=SKIP_EXECUTION_TASK_ID, dag=dag)    


    def build_labeling_logic(parent_dag_id, dag_id):
        dag_subdag = DAG('{0}.{1}'.format(parent_dag_id, dag_id), schedule_interval=None, start_date=datetime(2018, 11, 1), catchup=False)
        
        def fork_label_branch(**context):
            # decision = context['dag_run'].conf.get('branch', 'run_labelers')
            # if decision == 'run_labelers':
            #     return 'run_labelers'
            # if decision == 'merge_labels':
            #     return 'merge_labels'
            # if decision == 'index_merged_labels':
            #     return 'index_merged_labels'
            # if decision == 'index_single_labels':
            #     return 'index_single_labels'
            # if decision == 'index_labels':
            #     return ['index_single_labels', 'index_merged_labels']
            # else:
            #     return 'run_labelers'
            

            # return 'index_single_labels'
            # return 'index_merged_labels'
            # return 'merge_labels'
            return "run_labelers"
            # return ['index_single_labels', 'index_merged_labels']


        RUN_LABELERS_TASK_ID='run_labelers'
        MERGE_LABELS_TASK_ID='merge_labels'
        INDEX_MERGED_LABELS_TASK_ID='index_merged_labels'
        INDEX_SINGLE_LABELS_TASK_ID='index_single_labels'
        fork_label = BranchPythonOperator(task_id=FORK_LABEL_TASK_ID,provide_context=True, python_callable=fork_label_branch, dag=dag_subdag)
        run_labelers = DummyOperator(task_id=RUN_LABELERS_TASK_ID, dag=dag_subdag)
        merge_labels = DummyOperator(task_id=MERGE_LABELS_TASK_ID, dag=dag_subdag)
        merge_labels2 = DummyOperator(task_id=MERGE_LABELS_TASK_ID+"2", dag=dag_subdag)        
        index_merged_labels = DummyOperator(task_id=INDEX_MERGED_LABELS_TASK_ID, dag=dag_subdag)    
        index_merged_labels2 = DummyOperator(task_id=INDEX_MERGED_LABELS_TASK_ID+"2", dag=dag_subdag)    
        index_merged_labels3 = DummyOperator(task_id=INDEX_MERGED_LABELS_TASK_ID+"3", dag=dag_subdag)    
        index_single_labels = DummyOperator(task_id=INDEX_SINGLE_LABELS_TASK_ID, dag=dag_subdag)
        index_single_labels2 = DummyOperator(task_id=INDEX_SINGLE_LABELS_TASK_ID+"2", dag=dag_subdag)

        fork_label >> index_single_labels
        fork_label >> index_merged_labels
        fork_label >> merge_labels >> index_merged_labels3
        fork_label >> run_labelers >> merge_labels2 >> index_merged_labels2
        run_labelers >> index_single_labels2
        
        return dag_subdag
        

    sub_dag = SubDagOperator(
        task_id=DAG_NAME_LABELING,
        subdag=build_labeling_logic(DAG_NAME, DAG_NAME_LABELING),
        dag=dag,
    )
    sub_dag2 = SubDagOperator(
        task_id=DAG_NAME_LABELING+"2",
        subdag=build_labeling_logic(DAG_NAME, DAG_NAME_LABELING+"2"),
        dag=dag,
    )

    is_standalone_execution >> [sub_dag, maprdb_read_session_metadata]
    maprdb_read_session_metadata >> gen_2_or_gen1 >> [sub_dag2, skip_execution]

    