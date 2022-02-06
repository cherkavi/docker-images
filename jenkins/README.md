tag:tool  
tag:jenkins  
tag:ci/cd  

# Jenkins
##  common data 
```shell
mkdir data
chmod 777 -R data
```

## Jenkins with ansible 
```shell
docker build -t jenkins-ansible -f Dockerfile-jenkins-with-ansible .
export JENKINS_IMAGE_NAME=jenkins-ansible
docker rm jenkins-server
```


## start jenkins
```shell
./jenkins-image.sh
```

```shell    
x-www-browser http://localhost:8080
```
