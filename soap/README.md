# SOAP 
main focus of current sub-project: emulate workplace of the SOAP manual tester

## links
* [mock SOAP services](https://castlemock.github.io/)
* [running SOAP UI in docker, how to ](https://www.soapui.org/docs/test-automation/running-in-docker/)
  * [generate SOAP mock server](https://www.soapui.org/docs/soap-mocking/service-mocking-overview/)
* [soap UI in docker](https://github.com/SmartBear/docker-soapui-testrunner)
* [soap ui curl wrapper](https://github.com/ddavison/docker-soapui)


## SOAP UI 
### from ddavison
```sh
docker run -d -p 3000:3000 ddavison/soapui

x-www-browser localhost:3000
```

### from soapui
[instruction](https://www.soapui.org/docs/test-automation/running-in-docker/)  
```sh
# docker pull smartbear/soapuios-testrunner
# mkdir reports
# mkdir ext

FOLDER_PROJECT=./project
FOLDER_REPORT=./reports
FOLDER_EXTENSION=./ext
docker run -v /path/to/your/soapui/project:/soapui smartbear/soapuios-testrunner -f/soapui /soapui/YourProject-soapui-project.xml
```