#!/bin/bash
# cd ./k8s/helm
NOW=$(date +%F)

GET_ALB=$(aws elbv2 describe-load-balancers --name aws --query LoadBalancers[0].CreatedTime --output text)

ALB_CREATED=$(date -d ${GET_ALB:0:10} +%s) # ${GET_DATE:0:10}
TODAY=$(date -d $NOW +%s)

echo $ALB_CREATED $TODAY
if [ "$ALB_CREATED" -lt "$TODAY" ]
then
  echo "Nothing to do"
  exit 0
fi

echo "UPDATE ROUTE53"

