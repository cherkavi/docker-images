tag:datastorage  
tag:database  
tag:rdbms  

## start mysql/mariadb 

### start/stop containers
```bash
docker-compose --project-name mysql_web -f mysql-with-adminpanel.yaml up
docker-compose --project-name mysql_web -f mysql-with-adminpanel.yaml down
```

### connect to container
```sh
docker exec -it web_mysql /bin/sh
```

### [connect to admin panel](http://localhost:8080/)
or
```sh
MYSQL_UI_HOST=`docker network inspect mysql_web_default | jq '.[0].Containers' | jq '.[] | select(.Name=="web_mysql_ui")' | jq -r .IPv4Address | awk -F '/' '{print $1}'`
www-x-browser $MYSQL_UI_HOST:8080
```
* server: mysql
* login/password: joomla
* 
### connect via console tool
```sh
source .env
DB_HOST=`docker network inspect mysql_web_default | jq '.[0].Containers' | jq '.[] | select(.Name=="web_mysql")' | jq -r .IPv4Address | awk -F '/' '{print $1}'`
mycli --user $MYSQL_USER --password $MYSQL_PASSWORD --host $DB_HOST --port $MYSQL_PORT --database $MYSQL_DATABASE 
```

### upload data import data 
```sh
docker exec web_mysql /bin/sh -c 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD" $MYSQL_DATABASE < /home/scripts/script-ddl.sql'
```

## convert mysql to sqlite
```sh
# pip install mysql-to-sqlite3
source .env
DB_HOST=`docker network inspect mysql_web_default | jq '.[0].Containers' | jq '.[] | select(.Name=="web_mysql")' | jq -r .IPv4Address | awk -F '/' '{print $1}'`
echo $DB_HOST

SQLITE_DB=output.sqlite
mysql2sqlite --sqlite-file  --mysql-host $DB_HOST --mysql-port $MYSQL_PORT  --mysql-database $MYSQL_DATABASE --mysql-user $MYSQL_USER --mysql-password $MYSQL_PASSWORD

sqlite3 $SQLITE_DB
```

## create readonly user
```sql
CREATE USER 'technik'@'%' IDENTIFIED BY PASSWORD '*6EE98E11D66BF587A6F24F3A59A4DC0405C3B4D0';
GRANT SELECT, SHOW VIEW ON *.* TO 'technik'@'%';
DROP USER 'technik'@'localhost';                                  
```
