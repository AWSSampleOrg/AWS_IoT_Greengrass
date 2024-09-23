#!/usr/bin/env bash

cd ~

sudo dnf install java-11-amazon-corretto -y
sudo useradd --system --create-home ggc_user
sudo groupadd --system ggc_group

# Edit /etc/sudoers
# sudo vim /etc/sudoers
# root    ALL=(ALL:ALL) ALL

# https://docs.aws.amazon.com/greengrass/v2/developerguide/manual-installation.html#download-greengrass-core-v2
# curl -s https://d2s8p88vqu9w66.cloudfront.net/releases/greengrass-nucleus-latest.zip >greengrass-nucleus-latest.zip
# unzip greengrass-nucleus-latest.zip -d GreengrassInstaller && rm greengrass-nucleus-latest.zip

curl -s https://d2s8p88vqu9w66.cloudfront.net/releases/greengrass-2.13.0.zip >greengrass-2.13.0.zip
unzip greengrass-2.13.0.zip -d GreengrassInstaller && rm greengrass-2.13.0.zip

# Put certificates that you deployed
# scp -i xxx -r certificates/output ec2-user@xx.xx.xx.xx:~
sudo mkdir -p /greengrass/v2
# sudo cp ~/output/device.pem.crt /greengrass/v2/device.pem.crt
# sudo cp ~/output/private.pem.key /greengrass/v2/private.pem.key
# sudo cp ~/output/AmazonRootCA1.pem /greengrass/v2/AmazonRootCA1.pem

# --setup-system-service true
# If you specify --setup-system-service true, the installer prints Successfully set up Nucleus as a system service if it set up and ran the software as a system service. Otherwise, the installer doesn't output any message if it installs the software successfully.
#
# --deploy-dev-tools true
# https://docs.aws.amazon.com/greengrass/v2/developerguide/install-gg-cli.html
# Use the --deploy-dev-tools argument when you first set up AWS IoT Greengrass Core software on your device. You must also specify --provision true to apply this argument.
sudo -E java -Droot="/greengrass/v2" -Dlog.store=FILE \
    -jar ./GreengrassInstaller/lib/Greengrass.jar \
    --init-config ./GreengrassInstaller/config.yaml \
    --component-default-user ggc_user:ggc_group \
    --setup-system-service true \
    --deploy-dev-tools true \
    --provision false
