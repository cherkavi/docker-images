SSH_IMAGE_NAME=ssh-server
SSH_PASS=secret
SSH_IMAGE_NAME=fedora/ssh

docker run --name $SSH_IMAGE_NAME -d -p 2200:22 -e SSH_USERPASS=$SSH_PASS $SSH_IMAGE_NAME

# docker run -d -e SSH_USERPASS=$SSH_PASS $SSH_IMAGE_NAME

