tag:ssh  

# ssh server
## using existing in docker hub
```sh
docker run atlassian/ssh-ubuntu:0.2.2
SSH_HOST=`docker inspect $(docker ps | grep ssh-ubuntu | awk '{print $1}')  | jq -r .[0].NetworkSettings.IPAddress`

# password: root
ssh root@$SSH_HOST
```


## start local ssh server
```sh
./ssh-image.sh
```

## connect to local ssh server
```sh
CONTAINER_USER=user
CONTAINER_PASSWORD=secret

docker inspect ssh-server | grep IPAddress
# localhost if empty
CONTAINER_HOST=172.17.0.2

echo $CONTAINER_PASSWORD | ssh -p 2200 user@${CONTAINER_HOST}
```

## for installing scp/rsync
```shell
docker exec -it ssh-server /bin/bash
dnf -y install rsync
dnf -y install openssh-clients 
```
```shell
sshpass -p "secret" rsync 1.txt user@localhost:~/1.txt
```
