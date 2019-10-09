# docker run --name ssh -d -p 2200:22 -e SSH_USERPASS=secret fedora/ssh
docker run -d -e SSH_USERPASS=secret fedora/ssh

# docker inspect <image> | grep IP
# ssh -p 2200 user@172.17.0.2

