# IBM App Connect Enterprise (ACE) / IBM Integration Bus (IIB)
> IBM Integration Bus (IIB), now known as IBM App Connect Enterprise (ACE),  
> is an enterprise integration solution that facilitates messaging and data transformation

## ibmcom/ace
```sh
docker search ibmcom
docker remove iib-container
docker run --name iib-container -e LICENSE=accept -p 7600:7600 -p 7800:7800 -p 7843:7843 -p 1883:1883 -p 9443:9443 ibmcom/ace:latest
docker ps -a
```

```sh
# curl requests
curl http://localhost:7600/apiv2 | jq .
curl -X POST http://localhost:7843/filter -H "Content-Type: application/json" -d '{"Order": {"Amount": 1200}}'
curl http://localhost:7843/response
```

```sh
docker exec -it iib-container bash


export PATH=$PATH:/opt/ibm/ace-11/server/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/ibm/ace-11/server/ct/lib:/opt/ibm/ace-11/server/xlxp/lib:/opt/ibm/ace-11/server/WMQFTE/lib:/opt/ibm/ace-11/server/MQ/lib:/opt/ibm/ace-11/server/lib:/opt/ibm/ace-11/server/dfdlc/lib:/opt/ibm/ace-11/server/cachesupport/lib:/opt/ibm/ace-11/server/xltxe/lib:/opt/ibm/ace-11/server/dfdl/lib:/opt/ibm/ace-11/server/xlxpc/lib:/opt/ibm/ace-11/server/ODBC/drivers/lib:/opt/ibm/ace-11/server/xml4c/lib:/opt/ibm/ace-11/common/jnr/lib:/opt/ibm/ace-11/common/jackson/lib:/opt/ibm/ace-11/common/jdk/jre/bin/j9vm/


# bin 
cd /opt/ibm/ace-11/server/bin

# log 
cat /home/aceuser/ace-server/config/common/log/integration_server.*.exceptionLog.txt
cat /home/aceuser/ace-server/log/integration_server.*.events.txt
```

```sh
IntegrationServer
mqsilist --help
mqsc --help
./mqsimsg -i QMGR -q OrderQueue -f order.xml
```


## https://github.com/ot4i/ace-docker
1. https://www.ibm.com/docs/en/app-connect/12.0?topic=cacerid-building-sample-app-connect-enterprise-image-using-docker
2. https://myibm.ibm.com/products-services/containerlibrary  
3. 
```sh
docker login cp.icr.io -u cp -p $IBM_ENTITLEMENT_KEY
```
4. !!! image not found !!!
```sh
# docker search cp.icr.io
docker run --name aceserver -p 7600:7600 -p 7800:7800 -p 7843:7843 --env LICENSE=accept --env ACE_SERVER_NAME=ACESERVER cp.icr.io/cp/appc/ace:12.0.12.10-r1@sha256:3a8c34c18f447053e6d26663b8b96d1ecfe2606c078ce2e0ed5b3c2e57c5ee93
docker run --name aceserver -p 7600:7600 -p 7800:7800 -p 7843:7843 --env LICENSE=accept --env ACE_SERVER_NAME=ACESERVER cp.icr.io/cp/appc/ace:12.0.12.9-r1@sha256:9773673defb2394762bcb4406ca4ca315d8b955727f4562f6ee73c91961d5ece
```

