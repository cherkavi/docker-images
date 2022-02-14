# Build:
# docker build . -t airflow_custom
# Start:
# docker run --rm --name airflow_local -p 8080:8080 airflow_custom
# docker run --entrypoint="" --interactive --tty -p 8080:8080 airflow_custom /bin/sh 
# docker logs airflow_local

FROM ubuntu:20.04

RUN apt update 
RUN apt install -y python3 python3-pip 

ARG AIRFLOW_USER_HOME=/opt/airflow/
RUN mkdir /opt/airflow/

ARG AIRFLOW_VERSION=2.0.2
ARG PYTHON_VERSION=3.8

# install workflow
RUN pip3 install apache-airflow==$AIRFLOW_VERSION --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-$AIRFLOW_VERSION/constraints-$PYTHON_VERSION.txt"

COPY config/airflow.cfg ${AIRFLOW_USER_HOME}/airflow.cfg
ARG AIRFLOW_CONFIG=${AIRFLOW_USER_HOME}/airflow.cfg
COPY script/entrypoint.sh ${AIRFLOW_USER_HOME}/entrypoint.sh

EXPOSE 8080
WORKDIR ${AIRFLOW_USER_HOME}

# airflow webserver & scheduler
ENTRYPOINT ["/opt/airflow/entrypoint.sh"]

