# Metrics Collector :: [Telegraf](https://github.com/influxdata/telegraf)

```
   +----------+      +-----------+        +-----------+     +----------+
   | observed |      | telegraf  |        | influxDB  |     | grafana  |
   | machine  <------+in observed+-------->           <-----+          |
   |          |      |  machine  |        |           |     |          |
   +----------+      +-----------+        +-----------+     +----------+
```
## Components in cheat sheet
* [how to InfluxDB](https://github.com/cherkavi/cheat-sheet/blob/master/influxdb.md)
* [what is Telegraf](https://github.com/cherkavi/cheat-sheet/blob/master/telegraf.md)

## start containers
```sh
docker compose up
```

## [Telegraf config](https://docs.influxdata.com/telegraf/v1.26/configuration/)
generate default Telegraf config
```sh
telegraf config > telegraf.conf
```

## Grafana start 
### Grafana start  with config 
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

### Grafana start with InfluxDB datasource
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