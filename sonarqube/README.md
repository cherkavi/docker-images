tag:tool  
tag:quality  
tag:codequality  


## manual installation
### DataStorage PostgreSQL
```sh
# install postgresql
apt-get install postgresql
 
# change password
passwd postgres
 
# init db 
# switch postgresql user
su - postgres
# execute postgres
psql
CREATE USER sonar;
ALTER USER sonar PASSWORD 'CAN BE OBTAINED BY LOOKING INTO SONARQUBE'S CONFIGURATION AS SHOWN BELOW';
CREATE DATABASE sonarqube WITH ENCODING 'UTF8' OWNER sonar TEMPLATE=template0;
\q
exit
 
# start postgresql now
systemctl start postgresql.service
 
# enable autostart during boot
systemctl enable postgresql.service
```

### SonarQube
```sh
# dedicated folder
mkdir -p /opt/sonarqube
cd /opt/sonarqube
 
# download sonarqube-developer edition
wget https://binaries.sonarsource.com/CommercialDistribution/sonarqube-developer/sonarqube-developer-7.4.zip
# download sonarqube-scanner tool
wget https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip
 
### unzip each file
unzip sonarqube-developer-7.4.zip
unzip sonar-scanner-cli-3.2.0.1227-linux.zip
unzip build-wrapper-linux-x86.zip
 
# user for SonarQube
useradd -r sonarqube
 
# change ownder to SonarQube for all folders
chown -R sonarqube:sonarqube sonarqube-*
```
