
running [Teamscale](https://www.cqse.eu/en/products/teamscale/landing/) locally
```sh
docker run --rm \
-v /home/soft/teamscale_local_5.7.x/database:/opt/teamscale/storage:rw \
-v /home/soft/teamscale_local_5.7.x/logs:/opt/teamscale/logs:rw \
-v /home/soft/teamscale_local_5.7.x/config/jvm.properties:/opt/teamscale/config/jvm.properties:ro \
-v /home/soft/teamscale_local_5.7.x/config/teamscale.properties:/opt/teamscale/config/teamscale.properties:ro \
-v /home/soft/teamscale_local_5.7.x/config/cache4j.config:/opt/teamscale/config/cache4j.config:ro \
-v /home/soft/teamscale_local_5.7.x/config/log4j2.yaml:/opt/teamscale/config/log4j2.yaml:ro \
-v /home/soft/teamscale_local_5.7.x/config/teamscale.license:/opt/teamscale/config/teamscale.license:ro \
-v /home/soft/teamscale_local_5.7.x/config/.keystore:/opt/teamscale/config/.keystore:ro \
-v /home/soft/teamscale_local_5.7.x/backup:/backup:rw \
-p 8095:8095 \
-dt cqse/teamscale:5.7.0
```
