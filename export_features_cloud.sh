#!/bin/bash



BASE_URL=https://xray.cloud.xpand-it.com
KEYS="CALC-640;CALC-641"
KEYS="XT-17;XT-18"
token=$(curl -H "Content-Type: application/json" -X POST --data @"cloud_auth.json" $BASE_URL/api/v1/authenticate| tr -d '"')
curl -H "Content-Type: application/json" -X GET -H "Authorization: Bearer $token" "$BASE_URL/api/v1/export/cucumber?keys=$KEYS" -o features.zip

rm -rf features/*.feature
unzip -o features.zip -d features
