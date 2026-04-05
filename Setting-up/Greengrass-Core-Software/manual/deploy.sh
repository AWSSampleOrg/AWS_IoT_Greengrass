#!/usr/bin/env bash

SOURCE_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)
cd ${SOURCE_DIR}
CERT_ARN=$(./certificates/create_keys_and_certificate.sh)

aws cloudformation deploy \
    --template-file template.yml \
    --stack-name greengrass-manual-installation \
    --parameter-overrides CertificateArn=$CERT_ARN \
    --capabilities CAPABILITY_NAMED_IAM
