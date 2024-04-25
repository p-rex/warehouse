#!/bin/bash

curl http://169.254.169.254/latest/meta-data/iam/security-credentials/ply-viper-ec2-role-4935a3a52f3

AWS_IMDS_V1_CREDENTIAL_URL=http://169.254.169.254/latest/meta-data/iam/security-credentials/
AWS_IAMROLE=`curl -s $AWS_IMDS_V1_CREDENTIAL_URL`
AWS_CREDENTIAL_JSON=`curl -s ${AWS_IMDS_V1_CREDENTIAL_URL}${AWS_IAMROLE}`

echo '--------- credential ---------'
echo AWS_ACCESS_KEY_ID=`echo $AWS_CREDENTIAL_JSON | jq .AccessKeyId`
echo AWS_SECRET_ACCESS_KEY=`echo $AWS_CREDENTIAL_JSON | jq .SecretAccessKey`
echo AWS_SESSION_TOKEN=`echo $AWS_CREDENTIAL_JSON | jq .Token`
