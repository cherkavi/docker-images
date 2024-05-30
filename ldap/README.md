# LDAP

## links
[openldap docker](https://github.com/osixia/docker-openldap)
[openldap with phpadmin](https://github.com/osixia/docker-phpLDAPadmin)
[java spring example](https://spring.io/guides/gs/authenticating-ldap/)

## application managing
### start application
```sh
# check access to containers
docker pull osixia/openldap:latest
docker pull osixia/phpldapadmin:latest

sudo apt install ldap-utils

docker-compose -f docker-compose.yaml up
```
### check: two containers should be started
```sh
docker ps | awk '{print $NF}' 
# NAMES
# phpldapadmin
# openldap
```

if openldap didn't start - clear internal data
```sh
sudo rm -rf data
```

### stop application
```sh
docker-compose down
```

## internal data
```sh
ls -la data/slapd/database
```

## web UI 
```sh
x-www-browser 127.0.0.1:80
# login: cn=admin,dc=vantage,dc=com
# pass: admin_admin

# import: for-import.ldif
```

## ports
```sh
LDAP_HOST="ldap://localhost"
BASE_DN="dc=vantage,dc=com"
LDAP_USER="cn=admin,$BASE_DN"  # LDAP_USER="cn=admin" # ldap_bind: Invalid credentials (49)
LDAP_PASSWORD="admin_admin"

ldapsearch -LLL -o ldif-wrap=no -H $LDAP_HOST -D $LDAP_USER -w $LDAP_PASSWORD -b $BASE_DN
ldapsearch -LLL -o ldif-wrap=no -H $LDAP_HOST -D $LDAP_USER -w $LDAP_PASSWORD -b "ou=people,dc=vantage,dc=com" "(cn=mouse, jerry)"

LDAP_USER="cn=slash/guy,ou=people,$BASE_DN"
LDAP_PASSWORD="slashguyspassword"
ldapsearch -LLL -o ldif-wrap=no -H $LDAP_HOST -D "$LDAP_USER" -w "$LDAP_PASSWORD" -b $BASE_DN

LDAP_USER="cn=mouse\\, jerry,ou=people,dc=vantage,dc=com"
LDAP_PASSWORD="jerryspassword"
ldapsearch -LLL -o ldif-wrap=no -H $LDAP_HOST -D "$LDAP_USER" -w "$LDAP_PASSWORD" -b $BASE_DN
ldapsearch -LLL -o ldif-wrap=no -H $LDAP_HOST -D "$LDAP_USER" -w "$LDAP_PASSWORD" -b "ou=people,dc=vantage,dc=com" "(cn=mouse, jerry)"
```


