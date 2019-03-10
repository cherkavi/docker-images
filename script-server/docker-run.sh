docker run -d -p 5000:5000 \
           -v /home/projects/docker-images/script-server/config/config.json:/app/conf/conf.json \
           -v /home/projects/docker-images/script-server/runners:/app/conf/runners \
           -v /home/projects/docker-images/script-server/scripts:/app/scripts \
           --name script-server \
           bugy/script-server:latest