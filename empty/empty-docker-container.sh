# docker run --name ssh -d -p 2200:22 -e SSH_USERPASS=secret fedora/ssh
docker run -it ubuntu:18.04 /bin/bash

# empty container with empty entry point and with current folder mapping
docker run --entrypoint="" --volume $(pwd):/host_folder --rm -it maprtech/pacc:6.1.0_6.0.0_ubuntu16 /bin/bash
