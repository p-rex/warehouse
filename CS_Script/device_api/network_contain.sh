#!/bin/bash

## Usage
# ./network_contain.sh [contain || lift_containment]


## Set variables
FALCON_CLIENT_ID=XXXXXX
FALCON_CLIENT_SECRET=YYYYYY
FALCON_CLOUD_API=api.crowdstrike.com #api.us-2.crowdstrike.com
TGT_AID=ZZZZZZZZ



## Get Baerer token
FALCON_API_BEARER_TOKEN=$(curl \
--silent \
--header "Content-Type: application/x-www-form-urlencoded" \
--data "client_id=${FALCON_CLIENT_ID}&client_secret=${FALCON_CLIENT_SECRET}" \
--request POST \
--url "https://$FALCON_CLOUD_API/oauth2/token" | \
jq -r '.access_token')


## Contain or Lift contain
curl  -X POST https://api.crowdstrike.com/devices/entities/devices-actions/v2?action_name=${1} \
-H "Authorization: Bearer $FALCON_API_BEARER_TOKEN" \
-H 'Accept: application/json' \
-H 'Content-Type: application/json' \
-d "{ \"ids\": [\"${TGT_AID}\"]}"


