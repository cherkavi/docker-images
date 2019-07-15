FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y software-properties-common

# you can use both repo for Python3.6
# RUN add-apt-repository ppa:jonathonf/python-3.6
RUN add-apt-repository ppa:deadsnakes/ppa && \
    add-apt-repository 'deb http://package.mapr.com/releases/v6.1.0/ubuntu binary trusty' && \
    add-apt-repository 'deb http://package.mapr.com/releases/MEP/MEP-6.2/ubuntu binary trusty' && \
    apt-get update && \
    apt-get install -y --allow-unauthenticated python3.6 python3-pip mapr-client

# next step is not necessary
RUN pip3 install --upgrade pip
RUN pip3 install --global-option=build_ext \
                 --global-option="--library-dirs=/opt/mapr/lib" \
                 --global-option="--include-dirs=/opt/mapr/include/" \
                 mapr-streams-python
