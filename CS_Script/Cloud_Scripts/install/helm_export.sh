#!/bin/bash

## About 
# This script creates 12 environment variables for helm installation


## Prerequsities
# export FALCON_CLIENT_ID=XXXXXXXXXXXX
# export FALCON_CLIENT_SECRET=XXXXXXXXXX
# export FALCON_CID=XXXXXXXXX-XX
# export FALCON_REGION =us-1 OR us-2

## Usage
# source /dev/stdin <<< "$(curl -s THIS_SCRIPT_URL)"




if [ $FALCON_REGION = 'us-1' ]; then
    export FALCON_CLOUD_API=api.crowdstrike.com
elif [ $FALCON_REGION = 'us-2' ]; then
    export FALCON_CLOUD_API=api.us-2.crowdstrike.com
fi


export FALCON_CONTAINER_REGISTRY=registry.crowdstrike.com

export FALCON_CS_API_TOKEN=$(curl \
--data "client_id=${FALCON_CLIENT_ID}&client_secret=${FALCON_CLIENT_SECRET}" \
--request POST \
--silent \
https://${FALCON_CLOUD_API}/oauth2/token | jq -cr '.access_token | values')
 
export FALCON_ART_USERNAME="fc-$(echo ${FALCON_CID} | awk '{ print tolower($0) }' | cut -d'-' -f1)"
 
export FALCON_ART_PASSWORD=$(curl -X GET -H "authorization: Bearer ${FALCON_CS_API_TOKEN}" \
https://${FALCON_CLOUD_API}/container-security/entities/image-registry-credentials/v1 \
| jq -cr '.resources[].token | values')



export FALCON_NAMESPACE=falcon-system
export FALCON_IMAGE_SECRET=cs-registry-secret
export FALCON_HELM_REPO=crowdstrike/falcon-sensor
