#!/bin/bash

awslocal s3api create-bucket --bucket my-bucket --create-bucket-configuration LocationConstraint=eu-central-1
awslocal sqs create-queue --queue-name my-sqs
