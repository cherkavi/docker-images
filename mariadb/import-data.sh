# put file files.sql to /home/technik/Downloads and just execute next line to import data
docker run --net=host -v /home/technik/Downloads:/sql -it arey/mysql-client --host=10.143.242.65 --port=3310 --user=root --password=example --database=files -e "source /sql/files.sql"
