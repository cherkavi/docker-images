#!/bin/bash

if [ -z "$JENKINS_IMAGE_NAME" ]; then
    JENKINS_IMAGE_NAME=jenkins/jenkins:lts-jdk11
fi

echo "using jenkins container: $JENKINS_IMAGE_NAME"

JENKINS_CONTAINER_NAME=jenkins-server

started_container=`docker ps -a --format "{{.Names}}" | grep $JENKINS_CONTAINER_NAME `

if [[ ${started_container} == "" ]]; then
    echo "create new container"
    docker run -p 8080:8080 -p 50000:50000 -v `pwd dirname $0`/data:/var/jenkins_home --network="host" --name $JENKINS_CONTAINER_NAME  $JENKINS_IMAGE_NAME
    # docker run --user root -p 8080:8080 -p 50000:50000 -v `pwd dirname $0`/jenkins_home:/var/jenkins_home $JENKINS_IMAGE_NAME
    # /var/jenkins_home/secrets/initialAdminPassword
else
    echo "start existing container"
    docker start $JENKINS_CONTAINER_NAME
    sleep 3
    docker ps
fi