[docker source](https://github.com/splunk/docker-splunk)  
[docker non-official](https://github.com/dennybritz/docker-splunk/blob/master/enterprise/README.md)
[how to splunk with docker](https://elatov.github.io/2017/09/using-splunk-with-docker/)  

additional parameters for start/stop container
```bash
#    -v /local/path/for/persistence/etc:/opt/splunk/etc \
#    -v /local/path/for/persistence/var:/opt/splunk/var \
```

start/stop container
```bash
docker run -d \
    -p 9000:8000 \
    -e "SPLUNK_START_ARGS=--accept-license" \
    -e "SPLUNK_PASSWORD=cherkavi" \
    --name splunk \
    splunk/splunk:latest
```

open default browser
```bash
echo "login into webui with: admin/cherkavi"
x-www-browser http://localhost:9000
```
