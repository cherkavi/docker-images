# LDAP

## start application
```sh
# check access to containers
docker pull osixia/openldap:latest
docker pull osixia/phpldapadmin:latest

docker-compose -f docker-compose.yaml up
```
```sh
x-www-browser 127.0.0.1:80
# login: cn=admin,dc=vantage,dc=com
# pass: admin_admin
```

## stop application
```sh
docker-compose down
```

## internal data
```sh
ls -la data/slapd/database
```
### clear internal data
```sh
sudo rm -rf data
```

## links
[openldap docker](https://github.com/osixia/docker-openldap)
[openldap with phpadmin](https://github.com/osixia/docker-phpLDAPadmin)
[java spring example](https://spring.io/guides/gs/authenticating-ldap/)
