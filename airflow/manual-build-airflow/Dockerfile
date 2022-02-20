FROM ubuntu:20.04

# Never prompt the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
# Define en_US
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8


RUN apt update 
# install python 
# timezone: RuntimeError: Unable to find any timezone configuration
RUN apt install -y python3 python3-pip tzdata
# install workflow
ARG AIRFLOW_VERSION=2.0.2
ARG PYTHON_VERSION=3.8
RUN pip3 install apache-airflow==$AIRFLOW_VERSION --constraint "https://raw.githubusercontent.com/apache/airflow/constraints-$AIRFLOW_VERSION/constraints-$PYTHON_VERSION.txt"

RUN mkdir /opt/airflow
ENV AIRFLOW_HOME=/opt/airflow

COPY config/airflow.cfg ${AIRFLOW_HOME}/airflow.cfg
ENV AIRFLOW_CONFIG=${AIRFLOW_HOME}/airflow.cfg

# scripts
COPY script/entrypoint.sh ${AIRFLOW_HOME}/entrypoint.sh
COPY script/start.sh ${AIRFLOW_HOME}/start.sh

# openssl rand -hex 30
ENV AIRFLOW__CORE__SECRET_KEY=b501152303a0a93a4fa27d3be2099b178ce3127d8b884e52ec2d88040e52
# from cryptography.fernet import Fernet
# print(Fernet.generate_key().decode()) 
ENV AIRFLOW__CORE__FERNET_KEY=uxSHU90HfSCB1pMCFCw31uxrw8fJCPKLdkfkYc5x8mc=

EXPOSE 8080

WORKDIR /opt/airflow

# >>> airflow initdb
RUN airflow db init

# create airflow user 
RUN airflow users  create --role Admin --username vitalii --email vitalii.cherkashyn@gmail.com --firstname Vitalii --lastname Cherkashyn --password vitalii

# airflow webserver & scheduler
ENTRYPOINT ["./entrypoint.sh"]

