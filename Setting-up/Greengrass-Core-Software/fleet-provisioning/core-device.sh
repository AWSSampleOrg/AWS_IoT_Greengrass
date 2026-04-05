#!/usr/bin/env bash

cd ~

sudo dnf install java-11-amazon-corretto -y
sudo useradd --system --create-home ggc_user
sudo groupadd --system ggc_group

# Edit /etc/sudoers
# sudo vim /etc/sudoers
# root    ALL=(ALL:ALL) ALL

# https://docs.aws.amazon.com/greengrass/v2/developerguide/manual-installation.html#download-greengrass-core-v2
curl -s https://d2s8p88vqu9w66.cloudfront.net/releases/greengrass-nucleus-latest.zip > greengrass-nucleus-latest.zip
unzip greengrass-nucleus-latest.zip -d GreengrassInstaller && rm greengrass-nucleus-latest.zip

# Download the AWS IoT fleet provisioning plugin
curl -s https://d2s8p88vqu9w66.cloudfront.net/releases/aws-greengrass-FleetProvisioningByClaim/fleetprovisioningbyclaim-latest.jar > GreengrassInstaller/aws.greengrass.FleetProvisioningByClaim.jar

# Put certificates that you deployed
sudo mkdir -p /greengrass/v2
sudo chmod 755 /greengrass
sudo cp -R ~/claim-certs /greengrass/v2
sudo curl -o /greengrass/v2/AmazonRootCA1.pem https://www.amazontrust.com/repository/AmazonRootCA1.pem

# Install the AWS IoT Greengrass Core software
# https://docs.aws.amazon.com/greengrass/v2/developerguide/fleet-provisioning.html#run-greengrass-core-v2-installer-fleet
sudo -E java -Droot="/greengrass/v2" -Dlog.store=FILE \
    -jar ~/GreengrassInstaller/lib/Greengrass.jar \
    --trusted-plugin ~/GreengrassInstaller/aws.greengrass.FleetProvisioningByClaim.jar \
    --init-config ./GreengrassInstaller/config.yaml \
    --component-default-user ggc_user:ggc_group \
    --setup-system-service true
