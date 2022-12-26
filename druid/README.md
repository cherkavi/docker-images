# Apache Druid
```sh
### https://github.com/apache/druid/blob/25.0.0/distribution/docker/docker-compose.yml
# wget https://raw.githubusercontent.com/apache/druid/25.0.0/distribution/docker/docker-compose.yml
# wget https://raw.githubusercontent.com/apache/druid/25.0.0/distribution/docker/environment

### download artifacts
### https://github.com/apache/druid/blob/24.0.2/distribution/docker/docker-compose.yml
wget https://raw.githubusercontent.com/apache/druid/24.0.2/distribution/docker/docker-compose.yml
wget https://raw.githubusercontent.com/apache/druid/24.0.2/distribution/docker/environment

## start druid
docker-compose -f docker-compose.yml up

x-www-browser http://localhost:8888
```

[REST API](https://druid.apache.org/docs/latest/operations/api-reference.html)
```sh
DRUID_HOST=localhost:8082
curl $DRUID_HOST/status
curl $DRUID_HOST/status/health

COORDINATOR_HOST=localhost:8888
curl -v $DRUID_HOST/druid/coordinator/v1/datasources/wikipedia
curl -v $DRUID_HOST/druid/coordinator/v1/wikipedia
```

```sh
# https://pypi.python.org/pypi/pydrill:
# https://github.com/druid-io/pydruid
pip3 install pydruid
```

https://pypi.org/project/pydruid/
```python
from pydruid.utils.filters import Dimension
from pydruid.client import *

# http://localhost:8888/druid/v2/sql
# query = PyDruid("broker:8082", 'druid/v2')
# query = PyDruid("druid://broker:8082", 'druid/v2')
# query = PyDruid("druid://coordinator:8082", 'druid/v2')

broker_url="http://localhost:8082"
query = PyDruid(broker_url, '/druid/v2/sql')
ts = query.select(datasource='wikipedia', granularity='all')
# df = query.export_pandas()
```

```sh
## stop druid
docker-compose -f docker-compose.yml down
```