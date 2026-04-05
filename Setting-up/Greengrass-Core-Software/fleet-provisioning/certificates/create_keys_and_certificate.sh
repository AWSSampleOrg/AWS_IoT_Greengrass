#!/usr/bin/env bash

# https://docs.aws.amazon.com/greengrass/v2/developerguide/manual-installation.html#create-thing-certificate
mkdir ~/claim-certs
cd ~/claim-certs

# This command creates private key, public key, and X.509 certificate files and registers and activates the certificate with AWS IoT.
certificate_arn=$(aws iot create-keys-and-certificate \
    --certificate-pem-outfile "claim.pem.crt" \
    --public-key-outfile "claim.public.pem.key" \
    --private-key-outfile "claim.private.pem.key" \
    --set-as-active \
    --query certificateArn \
    --output text)

echo $certificate_arn
