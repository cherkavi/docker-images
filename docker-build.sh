#!/bin/sh
# file 'docker-build.sh' should be in the same folder with Dockerfile

TAG_NAME="name of the container to run it"

docker build -t $TAG_NAME \
--build-arg http_proxy=$http_proxy \
--build-arg https_proxy=$https_proxy \
--build-arg no_proxy=$no_proxy \
-f `dirname $0`/Dockerfile `dirname $0`
