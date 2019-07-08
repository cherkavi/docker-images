FROM ubuntu:16.04

RUN apt-get update \
  && apt-get install -y python3-pip python3-dev \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3 python \
  && pip3 install --upgrade pip

RUN apt-get update && apt-get install -y software-properties-common && apt-get install gcc

RUN add-apt-repository 'deb http://package.mapr.com/releases/v6.1.0/ubuntu binary trusty' && \
    add-apt-repository 'deb http://package.mapr.com/releases/MEP/MEP-6.2/ubuntu binary trusty' && \
    apt-get update && apt-get install -y --allow-unauthenticated mapr-client

RUN apt-get update && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y ant && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/ && \
    rm -rf /var/cache/oracle-jdk8-installer;

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/

RUN export JAVA_HOME

RUN /opt/mapr/server/configure.sh \
-N dp.prod.munich \
-c -secure -C ubsdpmesp000004.vantage.org:7222,ubsdpmesp000010.vantage.org:7222

ENV LD_LIBRARY_PATH /opt/mapr/lib:/usr/lib/x86_64-linux-gnu

RUN export LD_LIBRARY_PATH

RUN pip install --global-option=build_ext \
                --global-option="--library-dirs=/opt/mapr/lib" \
                --global-option="--include-dirs=/opt/mapr/include/" mapr-streams-python

# add file after logging to maprcli: maprlogin password -user my_cluster_username
ADD tech_user_monitoring.ticket /tmp/maprticket_202208
ENV MAPR_TICKETFILE_LOCATION /tmp/maprticket_202208

# user for container that must exists on cluster, the same like in hadoop - local user name has all right on remote host
RUN useradd -ms /bin/bash my_cluster_username

# custom application 
RUN mkdir -p /app
ADD ./lib /app/lib
ADD ./MyProducer.class /app
ADD ./MyConsumer.class /app
RUN touch /app/out.txt
RUN chown my_cluster_username /app/* /app/lib/*

USER my_cluster_username
WORKDIR /app
