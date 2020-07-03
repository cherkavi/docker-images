# [SQLite](https://www.sqlite.org/)
just a process with access to file ( like old-style db-files )
```text
Multiple processes can have the same SQLite database open at the same time with read accesses ( can be satisfied in parallel ).
In case of writing, a single write to the database locks the database for a short time, nothing, even reading, can access the database file at all.
```

usage example
```sh
PATH_TO_DB="/home/projects/xing/database/messages.db"
./build-container.sh
./run-container-db-path.sh $PATH_TO_DB
```
![schema](https://i.postimg.cc/fyfcsW49/sqlite-docker-schema.png)
