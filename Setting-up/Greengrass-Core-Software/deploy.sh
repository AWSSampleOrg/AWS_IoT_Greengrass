#!/usr/bin/env bash

SOURCE_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}) && pwd)
cd ${SOURCE_DIR}

STACK_NAME="IoT-Greengrass"
CA_PEM_STRING=$(cat certificates/output/root_CA_cert_filename.pem)
CERTIFICATE_PEM_STRING=$(cat certificates/output/device_cert_filename.pem)
VERIFICATION_CERTIFICATE_PEM_STRING=$(cat certificates/output/verification_cert_filename.pem)

aws cloudformation deploy \
    --template-file template.yml \
    --stack-name ${STACK_NAME} \
    --parameter-overrides \
    ProjectPrefix="" \
    CACertificatePem="${CA_PEM_STRING}" \
    CertificatePem="${CERTIFICATE_PEM_STRING}" \
    VerificationCertificatePem="${VERIFICATION_CERTIFICATE_PEM_STRING}" \
    --capabilities CAPABILITY_NAMED_IAM

aws iot add-thing-to-thing-group --thing-name MyGreengrassCore --thing-group-name MyGreengrassCoreGroup
