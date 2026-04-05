# -*- encoding:utf-8 -*-
import json
from logging import getLogger, StreamHandler, DEBUG
import os
import boto3

# logger setting
logger = getLogger(__name__)
handler = StreamHandler()
handler.setLevel(DEBUG)
logger.setLevel(os.getenv("LOG_LEVEL", DEBUG))
logger.addHandler(handler)
logger.propagate = False

# IoT Core
iot_core = boto3.client("iot-data")
def lambda_handler(event, context):
    logger.info(json.dumps(event))

    return {
        'allowProvisioning': True,
        'parameterOverrides': {}
    }
