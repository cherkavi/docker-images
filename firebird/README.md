tag:datastorage  
tag:database  
tag:rdbms  

# Manual installation
```sh
http://sourceforge.net/projects/firebird/files/firebird-linux-i386/2.1.2-Release/FirebirdCS-2.1.2.18118-0.i686.tar.gz/download
tar -xvf FirebirdSS-2.0.3.12981-1.amd64.tar.gz
./install.sh
```

# Installation via package manager
```sh
sudo apt-get install libstdc++5
sudo apt-get install firebird2-super-server
```

# setup after installation
```sh
# Copy your UDF into:
/opt/firebird/UDF/*

#change rights on UDF's folder:
chown root:root /opt/firebird/UDF/*
chmod 444 /opt/firebird/UDF/*
```

# connect via native client
```sh
/opt/firebird/bin/isql -u SYSDBA -p masterkey /opt/firebird/examples/empbuild/employee.fdb
```
```sql
show tables;
select * from sales;
```

# backup
```sh
# create backup
gbak  -b -t -v -USER SYSDBA -PASS <put SYSDBA password here> <put path and name of the database here> <put path and name of the backup file here>

# restore from backup
gbak  -c -v -t -USER SYSDBA -PASS <put SYSDBA password here> <put path and name of the backup file here> <put path and name of the database here>
```

