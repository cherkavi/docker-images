sudo docker run \
	--volume=/var/run:/var/run:rw \
	--volume=/sys:/sys:ro \
	--volume=/var/lib/docker/:/var/lib/docker:ro \
	--volume=/cgroup:/cgroup:ro \
	--privileged=true \
	--publish=9089:8080 \
	--detach=false \
	--name=cadvisor \
	google/cadvisor:latest
