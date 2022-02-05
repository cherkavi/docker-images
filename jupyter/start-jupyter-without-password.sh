docker stop jupyter-notebook-data-management
docker rm jupyter-notebook-data-management

echo "user: jovyan"

docker run \
-d -p 8778:8888 \
--user root \
-e NB_GID=100 \
-e GRANT_SUDO=yes \
-e RESTARTABLE=yes  \
--env-file env-local \
-e HTTP_PROXY=$HTTP_PROXY \
-e http_proxy=$http_proxy \
-e HTTPS_PROXY=$HTTPS_PROXY \
-e https_proxy=$https_proxy \
-e NO_PROXY=$NO_PROXY \
-e no_proxy=$no_proxy \
-v $(pwd):/home/jovyan/work \
--name jupyter-notebook-data-management \
jupyter/scipy-notebook:17aba6048f44 \
start-notebook.sh  --NotebookApp.token=''  --allow-root
