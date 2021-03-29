NETWORK_NAME="my-local"

network_exists=`docker network ls | grep $NETWORK_NAME | wc -l`
if [[ $network_exists -gt 0 ]]; then
	echo "network exists"
else
	docker network create --driver bridge $NETWORK_NAME
fi
