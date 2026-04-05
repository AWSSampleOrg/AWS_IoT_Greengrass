# 1. Deploy CloudFormation stack

- Install AWS IoT Greengrass Core software with manual resource provisioning
  https://docs.aws.amazon.com/greengrass/v2/developerguide/manual-installation.html

```sh
./deploy.sh
```

# 2. Update GreengrassInstaller/config.yaml

Especially replace `iotDataEndpoint`, `iotCredEndpoint`, and `awsRegion` with yours.

# 3. Core device

```sh
./core-device.sh
```
