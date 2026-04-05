#!/usr/bin/env bash

SOURCE_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)
cd ${SOURCE_DIR}
CERT_ARN=$(./certificates/create_keys_and_certificate.sh)

S3_BUCKET=''

aws cloudformation package \
    --template-file template.yml \
    --s3-bucket ${S3_BUCKET} \
    --output-template-file packaged_template.yml

aws cloudformation deploy \
    --template-file packaged_template.yml \
    --stack-name greengrass-fleet-provisioning \
    --parameter-overrides CertificateArn=$CERT_ARN \
    --capabilities CAPABILITY_NAMED_IAM
