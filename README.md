[docker hub](https://hub.docker.com/search?q=&type=image)  
search in docker hub for a 'ssh'  
```sh
SEARCH_CRITERIA=ssh
docker search $SEARCH_CRITERIA
docker search --filter=stars=3 --no-trunc $SEARCH_CRITERIA
docker search --format "{{.Name}}: {{.StarCount}}" $SEARCH_CRITERIA
```

# for using predefined scripts in documentation properties
update your ".bashrc" with next aliases   
( or just update destination session )
```sh
export ROOT_DOCKER_IMAGES="/home/projects/docker-images"
```

# collections
* [bitnami collection](https://github.com/bitnami)

# docker-images
set of docker images for general purposes:

- ubuntu-jdk8-tomcat7-war<br/>
   OS ubuntu, Oracle jdk8, Tomcat7 and custom WAR applicaiton will be copied into container

- centos-jdk7-jboss-ear <br/>
   OS CentOS, Oracle jdk7, JBoss and custom EAR application will be copied into container
