# mvn sonar:sonar
# mvn sonar:sonar -Dsonar.host.url=http://$(boot2docker ip):9000 -Dsonar.jdbc.url="jdbc:h2:tcp://$(boot2docker ip)/sonar"
docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube