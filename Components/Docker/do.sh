#!/usr/bin/env bash
AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text --profile default)
AWS_REGION=$(aws configure get region --profile default)
APPLICATION_IMAGE_NAME="app:latest"

SOURCE_DIR=$(cd $(dirname ${BASH_SOURCE:-0}) && pwd)
cd ${SOURCE_DIR}

if [ "build" = $1 ]; then
    docker image build -t ${APPLICATION_IMAGE_NAME} work/app
elif [ "push" = $1 ]; then
    docker image push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/app
elif [ "rmc" = $1 ]; then
    docker container ps -aq | xargs docker container rm -f
elif [ "rmi" = $1 ]; then
    docker image ls -aq | xargs docker image rm -f
elif [ "run" = $1 ]; then
    docker container run -itd
elif [ "tag" = $1 ]; then
    docker image tag ${APPLICATION_IMAGE_NAME} ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/app
elif [ "deploy" =$1 ]; then
    version=$2
    if [ $(ls "artifacts/com.example.Docker/${version}") -eq 0 ]; then
        sudo /greengrass/v2/bin/greengrass-cli deployment create \
            --recipeDir ./recipes \
            --artifactDir ./artifacts \
            --merge "com.example.Docker=${version}"
    fi
fi
