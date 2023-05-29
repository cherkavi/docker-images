TODO - run it and fix all issues
# Metrics Collector :: [Telegraf](https://github.com/influxdata/telegraf)
Telegraf is an open-source agent written in the Go. 
It collects, manages, processes, and aggregates metrics of a DevOps system or machine

```
   +----------+      +-----------+        +-----------+     +----------+
   | observed |      | telegraf  |        | influxDB  |     | grafana  |
   | machine  <------+in observed+-------->           <-----+          |
   |          |      |  machine  |        |           |     |          |
   +----------+      +-----------+        +-----------+     +----------+
```
## Components in cheat sheet
* [how to InfluxDB](https://github.com/cherkavi/cheat-sheet/blob/master/influxdb.md)


## start containers
```sh
docker compose up
```


## [docker containers of TICK stack](https://github.com/influxdata/influxdata-docker)
> infrastructure monitoring, alert management, data visualization, and database management
* chronograf 
  > to visualize your monitoring data and easily create alerting and automation rules.
  * [chronograf docker](https://registry.hub.docker.com/_/chronograf/)
  * [chronograf doc](https://docs.influxdata.com/chronograf/v1.10/)
* kapacitor
  > to import (stream or batch) time series data, and then transform, analyze, and act on the data.
  * [kapacitor docker](https://registry.hub.docker.com/_/kapacitor/)
  * [kapacitor doc](https://docs.influxdata.com/kapacitor/v1.6/introduction/getting-started/)
* telegraf
* influxdb


## [Telegraf docker](https://docs.influxdata.com/platform/install-and-deploy/deploying/sandbox-install/)

## [Telegraf config](https://docs.influxdata.com/telegraf/v1.26/configuration/)
generate default Telegraf config
```sh
telegraf config > telegraf.conf
```

Possible run 
* Filename: ` --config /etc/default/telegraf`
* include all files ending with .conf: `--config-directory /path/to/folder` 
* Remote URL: ` --config "http://remote-URL-endpoint"`


## Grafana start with config 
```yaml
version: '3'
services:
  grafana:
    image: grafana/grafana
    ports:
      - 3000:3000
    volumes:
      - ./datasource.yaml:/etc/grafana/provisioning/datasources/datasource.yaml
    environment:
      - GF_PATHS_PROVISIONING=/etc/grafana/provisioning
```

### Grafana with InfluxDB datasource
```yaml
apiVersion: 1

datasources:
- name: InfluxDB
  type: influxdb
  access: proxy
  url: http://influxdb.example.com:8086
  database: mydatabase
  user: myusername
  password: mypassword
  basicAuth: true
  isDefault: true
  editable: false
```

### Grafana with Prometheus datasource
datasource.yaml
```yaml
apiVersion: 1

datasources:
- name: Prometheus
  type: prometheus
  access: proxy
  url: http://prometheus.example.com:9090
  basicAuth: false
  isDefault: true
  editable: false
```