#!/usr/bin/env bash

# https://docs.aws.amazon.com/greengrass/v2/developerguide/manual-installation.html#create-thing-certificate
mkdir ~/greengrass-v2-certs
cd ~/greengrass-v2-certs

# This command creates private key, public key, and X.509 certificate files and registers and activates the certificate with AWS IoT.
certificate_arn=$(aws iot create-keys-and-certificate \
    --set-as-active \
    --certificate-pem-outfile device.pem.crt \
    --public-key-outfile public.pem.key \
    --private-key-outfile private.pem.key \
    --query certificateArn \
    --output text)

echo $certificate_arn
