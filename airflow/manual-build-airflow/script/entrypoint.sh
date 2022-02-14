# init workflow
echo ">>> airflow initdb "
airflow db init

# create user first login
echo ">>> airflow users "
airflow users  create \
--role Admin \
--username vitalii \
--email vitalii.cherkashyn@gmail.com \
--firstname Vitalii --lastname Cherkashyn \
--password vitalii

# airflow resetdb - for reseting all data 
echo ">>> airflow scheduler "
airflow scheduler &

echo ">>> airflow webserver "
airflow webserver -p 8080