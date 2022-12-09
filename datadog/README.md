```
[Unit]
Description=Datadog agent
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=5
Restart=always
ExecStartPre=-/usr/bin/docker stop datadog-agent 
ExecStartPre=-/usr/bin/docker rm datadog-agent 
ExecStart=/usr/bin/docker run \
    --name datadog-agent \
    -e DD_API_KEY={} \
    -e DD_LOGS_ENABLED=true \
    -e DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL=true \
    -e DD_CONTAINER_EXCLUDE="name:datadog-agent" \
    -e DD_ENV={} \
    -e DD_SERVICE={} \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    -v /proc/:/host/proc/:ro \
    -v /opt/datadog-agent/run:/opt/datadog-agent/run:rw \
    -v /sys/fs/cgroup/:/host/sys/fs/cgroup:ro \
    datadog/agent:latest
ExecStop=-/usr/bin/docker stop datadog-agent

[Install]
WantedBy=multi-user.target
```
