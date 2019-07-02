# FROM codenvy/jdk8_maven3_tomcat8
FROM ahawker/jre-8.181.13

LABEL owner="Vitalii Cherkashyn"\
      project="run java application"\      
      module="java standalone app"


RUN mkdir -p /app
ADD ./lib /app/lib
ADD ./MyProducer.class /app
ADD ./MyConsumer.class /app
WORKDIR /app

# ENTRYPOINT [ "/usr/bin/java -classpath /app/lib/kafka-clients-1.1.1-mapr-1808.jar:/app/lib/slf4j-api-1.7.12.jar:/app/lib/slf4j-log4j12-1.7.12.jar:/app/lib/log4j-1.2.17.jar:/app/lib/mapr-streams-6.1.0-mapr.jar:/app/lib/maprfs-6.1.0-mapr.jar:/app/lib/protobuf-java-2.5.0.jar:/app/lib/hadoop-common-2.7.0.jar:/app/lib/commons-logging-1.1.3-api.jar:/app/lib/commons-logging-1.1.3.jar:/app/lib/guava-14.0.1.jar:/app/lib/commons-collections-3.2.2.jar:/app/lib/hadoop-auth-2.7.0-mapr-1808.jar:/app/lib/commons-configuration-1.6.jar:/app/lib/commons-lang-2.6.jar:/app/lib/jackson-core-2.9.5.jar:/app/ MyConsumer" ]
ENTRYPOINT [ "/usr/bin/java -version" ]
