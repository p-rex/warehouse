#!/bin/bash


FALCON_API_BEARER_TOKEN=$(curl \
--silent \
--header "Content-Type: application/x-www-form-urlencoded" \
--data "client_id=${FALCON_CLIENT_ID}&client_secret=${FALCON_CLIENT_SECRET}" \
--request POST \
--url "https://$FALCON_CLOUD_API/oauth2/token" | \
jq -r '.access_token')

# echo $FALCON_API_BEARER_TOKEN



curl -X GET "https://$FALCON_CLOUD_API/container-security/combined/image-assessment/images/v1?limit=1" \
    -H  "accept: application/json" \
    -H  "authorization: Bearer $FALCON_API_BEARER_TOKEN"
