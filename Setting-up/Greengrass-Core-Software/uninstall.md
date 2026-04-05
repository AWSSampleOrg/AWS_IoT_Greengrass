https://docs.aws.amazon.com/greengrass/v2/developerguide/uninstall-greengrass-core-v2.html

Systemd service

```sh
sudo systemctl stop greengrass.service
sudo systemctl disable greengrass.service
sudo rm /etc/systemd/system/greengrass.service
sudo systemctl daemon-reload && sudo systemctl reset-failed
```

Delete the all Greengrass V2 files.

```sh
sudo rm -rf /greengrass/v2
```

Delete the core device

```sh
aws greengrassv2 delete-core-device --core-device-thing-name MyGreengrassCore
```
