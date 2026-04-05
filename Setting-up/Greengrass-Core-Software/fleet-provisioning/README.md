# 1. Deploy CloudFormation stack

- Create a token exchange role
  https://docs.aws.amazon.com/greengrass/v2/developerguide/fleet-provisioning-setup.html
- Create an AWS IoT policy
  https://docs.aws.amazon.com/greengrass/v2/developerguide/fleet-provisioning-setup.html#create-iot-policy
- Create a fleet provisioning template
  https://docs.aws.amazon.com/greengrass/v2/developerguide/fleet-provisioning-setup.html#create-provisioning-template
- Create a provisioning claim certificate and private key
  https://docs.aws.amazon.com/greengrass/v2/developerguide/fleet-provisioning-setup.html#create-claim-certificates

```sh
./deploy.sh
```

# 2. Update GreengrassInstaller/config.yaml

Especially replace `iotDataEndpoint`, `iotCredEndpoint`, and `awsRegion` with yours.

# 3. Core device

```sh
./core-device.sh
```
