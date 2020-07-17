[image official documentation](https://jupyter-docker-stacks.readthedocs.io/en/latest/)  
[jupyter config](https://jupyter-notebook.readthedocs.io/en/stable/config.html)  


possible images:
* jupyter/scipy-notebook:17aba6048f44
* jupyter/base-notebook


run jupyter without password, run jupyter without token, user jovyan
```sh
docker stop jupyter-notebook
docker rm jupyter-notebook

docker run \
-d -p 9999:8888 \
-e GRANT_SUDO=yes \
-e RESTARTABLE=yes  \
-v $(pwd):/home/jovyan/work \
--name jupyter-notebook \
jupyter/scipy-notebook:17aba6048f44 \
start-notebook.sh  --NotebookApp.token=''
```

run jupyter without password, run jupyter without token, root user
> allow you to execute ```!sudo apt update & sudo apt install curl ```
```sh
docker stop jupyter-notebook
docker rm jupyter-notebook

docker run  \
-d -p 9999:8888 \
--user root \
-e NB_GID=100 \
-e GRANT_SUDO=yes \
-e RESTARTABLE=yes  \
-v $(pwd):/home/jovyan/work \
--name jupyter-notebook \
jupyter/scipy-notebook:17aba6048f44 \
start-notebook.sh  --NotebookApp.token=''  --allow-root
```
