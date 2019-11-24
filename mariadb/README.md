tag:datastorage  
tag:database  
tag:rdbms  

# create readonly user
```sql
CREATE USER 'technik'@'%' IDENTIFIED BY PASSWORD '*6EE98E11D66BF587A6F24F3A59A4DC0405C3B4D0';
GRANT SELECT, SHOW VIEW ON *.* TO 'technik'@'%';
DROP USER 'technik'@'localhost';                                  
```
