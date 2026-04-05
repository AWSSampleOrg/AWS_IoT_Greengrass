#!/usr/bin/env bash

cd ~

sudo mkdir -p ~/greengrassv2/{artifacts,recipes}
cd ~/greengrassv2
sudo mkdir -p artifacts/com.example.HelloWorld/1.0.0
# vim artifacts/com.example.HelloWorld/1.0.0/hello_world.py
# vim recipes/com.example.HelloWorld-1.0.0.json
