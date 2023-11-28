#!/bin/bash

## Set Environment Variables
source $1
if [ -n "$CS_STREAM_OFFSET" ]; then
    query_offset="&offset=${CS_STREAM_OFFSET}"
fi

## Load functions
eval "$(curl -s 'https://raw.githubusercontent.com/p-rex/cs-stream-logscale-conector/main/src/functions.sh')"


## Get OAuth2 Token
log_msg "get oauth2 token"
FALCON_API_BEARER_TOKEN=`getBearerToken`


## Get streaming URL
log_msg "get streaming url"
DISCOVER_URL="${CS_APIURL}/sensors/entities/datafeed/v2?format=json&appId=${RANDOM}"
RESP_JSON=$(curl -sS -f -X GET -H "authorization: Bearer ${FALCON_API_BEARER_TOKEN}" $DISCOVER_URL )
dataFeedURL=$(echo $RESP_JSON | jq -r '.resources[].dataFeedURL' )
dataFeedToken=$(echo $RESP_JSON | jq -r '.resources[].sessionToken.token' )
dataFeedExpiration=$(echo $RESP_JSON | jq -r '.resources[].sessionToken.expiration' )
refresh_active_session_url=$(echo $RESP_JSON | jq -r '.resources[0].refreshActiveSessionURL' )


## Start streaming
log_msg "start streaming"
curl -s -f -k -N -X GET ${dataFeedURL}${query_offset} \
    -H "Accept: application/json" \
    -H "Authorization: Token ${dataFeedToken}" \
    | tee $LOG_FILE
