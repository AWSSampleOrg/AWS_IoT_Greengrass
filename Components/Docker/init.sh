#!/usr/bin/env bash

cd ~

# docker
sudo dnf install -y docker
sudo usermod -aG docker ec2-user
sudo curl "https://github.com/docker/compose/releases/download/v2.29.7/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo mkdir -p ~/greengrassv2/{artifacts,recipes}
cd ~/greengrassv2
sudo mkdir -p artifacts/com.example.Docker/1.0.0
# vim artifacts/com.example.Docker/1.0.0/docker-compose.yaml
# vim recipes/com.example.Docker-1.0.0.json
