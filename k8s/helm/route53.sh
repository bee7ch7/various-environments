#!/bin/bash
# cd ./k8s/helm

VAR=$(pulumi stack output kinesisFirehoseRole -s bee7ch7/experiments/dev)

echo $VAR

RESULT=$(aws elbv2 describe-load-balancers --name aws --query LoadBalancers[0].CreatedTime --output text)
GET_DATE=${RESULT:0:10}

ALB_CREATED=$(date -d ${GET_DATE:0:10} +%s)
TODAY=$(date +%F +%s)

echo $ALB_CREATED $TODAY
if [ $ALB_CREATED -ne $TODAY ]
then
  echo "Nothing to do"
  exit 0
fi

echo "UPDATE ROUTE53"

