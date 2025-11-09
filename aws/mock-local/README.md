# [Localstack](https://www.localstack.cloud/localstack-for-aws)
> use AWS services locally 

## [Localstack documentation](https://docs.localstack.cloud)

## installation
* https://app.localstack.cloud/getting-started
* https://docs.localstack.cloud/aws/getting-started/installation/

### download and unpack localstack
```sh
curl --output localstack-cli-4.10.0-linux-amd64-onefile.tar.gz \
    --location https://github.com/localstack/localstack-cli/releases/download/v4.10.0/localstack-cli-4.10.0-linux-amd64-onefile.tar.gz
localstack --version
```
### [install awslocal](https://docs.localstack.cloud/aws/integrations/aws-native-tools/aws-cli/#localstack-aws-cli-awslocal)
```sh
pip install --break-system-packages awscli-local
awslocal --version
```

## SetUp
```sh
export AWS_ACCESS_KEY_ID="test"
export AWS_SECRET_ACCESS_KEY="test"
export AWS_DEFAULT_REGION="us-east-1"
```

## Start 
### [start in docker](https://docs.localstack.cloud/aws/getting-started/installation/#localstack-docker-extension)
```sh
docker-compose up
```
### start via console
```sh
localstack auth set-token $AWS_LOCALSTACK_TOKEN # obtain and activate token 
localstack start
```

## [working with services](https://docs.localstack.cloud/aws/getting-started/quickstart/)
```sh
aws      s3 mb s3://bucket1 --endpoint-url=http://127.0.0.1:4566
awslocal s3 mb s3://bucket2

awslocal s3 ls 
```
