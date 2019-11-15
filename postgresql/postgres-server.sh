container_name="postgres-docker"
started_container=`docker ps -a --filter "name=^postgres-docker$" --format "{{.Names}}"`

master_password="docker"
external_port=5432
external_folder=`pwd dirname $0`/data


if [ -z "$started_container" ]
then
    sudo docker run --rm --name $container_name -e POSTGRES_PASSWORD=$master_password -d -p $external_port:5432 -v $external_folder:/var/lib/postgresql/data  postgres
    echo "docker run -it --rm --network='host' postgres psql -h 0.0.0.0 -U postgres"
else
    sudo docker start $container_name
    sleep 2
    docker ps  
fi
