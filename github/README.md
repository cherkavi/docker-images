tag:code  
tag:git  

# git 
git service git standalone git private local

## start container 
```sh
docker-compose up
```

## create DB for git
```sh
mycli mysql://root:root@localhost:3306
```
```sql
create database gitlocal
show databases;
```

## setup git after start
```shell
x-www-browser http://localhost:3000/install
```
* mysql
* user: root
* pass: root
* host: db:3306

## new user
login: one@one.com
 pass: one&one

