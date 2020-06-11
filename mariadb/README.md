tag:datastorage  
tag:database  
tag:rdbms  

```bash
# example of start with project name
docker-compose --project-name mysql_web -f mysql-with-admin.yaml up
# example of upload data
docker exec mysql_web_mysql_1 /bin/sh -c 'mysql -uroot -p"$MYSQL_ROOT_PASSWORD" < /scripts/script-ddl.sql'
```

# create readonly user
```sql
CREATE USER 'technik'@'%' IDENTIFIED BY PASSWORD '*6EE98E11D66BF587A6F24F3A59A4DC0405C3B4D0';
GRANT SELECT, SHOW VIEW ON *.* TO 'technik'@'%';
DROP USER 'technik'@'localhost';                                  
```
