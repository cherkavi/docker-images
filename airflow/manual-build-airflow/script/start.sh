# airflow resetdb - for reseting all data 
echo ">>> airflow scheduler "
airflow scheduler &

echo ">>> airflow webserver "
airflow webserver -p 8080