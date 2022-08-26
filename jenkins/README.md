tag:tool  
tag:jenkins  
tag:ci/cd  

# Jenkins
## jenkins start via script
```sh
./jenkins-image.sh
# or with specifying 
JENKINS_IMAGE_NAME=jenkins-ansible ./jenkins-image.sh
```
## jenkins start
```sh
docker run -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins
docker run -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk11
docker run -d -v data:/var/jenkins_home -p 8080:8080 -p 50000:50000 --restart=on-failure jenkins/jenkins:lts-jdk11
```
### open jenkins 
```shell    
x-www-browser http://localhost:8080
```


## jenkins with ansible 
###  common data 
```shell
mkdir data
chmod 777 -R data
```
### Jenkins with ansible 
```shell
docker build -t jenkins-ansible -f Dockerfile-jenkins-with-ansible .
export JENKINS_IMAGE_NAME=jenkins-ansible
docker rm jenkins-server
```
### start jenkins
```shell
./jenkins-image.sh
```
### open jenkins 
```shell    
x-www-browser http://localhost:8080
```
