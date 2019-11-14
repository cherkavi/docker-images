container_name="postgres-docker"
master_password="docker"
external_port=5432
external_folder=$HOME/temp/volumes/postgres

docker run --rm --name $container_name -e POSTGRES_PASSWORD=$master_password -d -p $external_port:5432 -v $external_folder:/var/lib/postgresql/data  postgres

# client, use $master_password
# docker run -it --rm --network="host" postgres psql -h 0.0.0.0 -U postgres
