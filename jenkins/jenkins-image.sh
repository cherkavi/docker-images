

started_container=`docker ps -a --filter "name=^jenkins-server$" --format "{{.Names}}"`
if [ -z "$started_container" ]
then
  docker run -p 8080:8080 -p 50000:50000 -v `realpath .`/data:/var/jenkins_home  --name jenkins-server  jenkins/jenkins:lts
  # docker run --user root -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
  # /var/jenkins_home/secrets/initialAdminPassword
else
  sudo docker start jenkins-server
  sleep 3
  docker ps
fi
