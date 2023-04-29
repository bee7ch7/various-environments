#!/bin/bash
# cd ./k8s/helm

VAR=$(pulumi stack output kinesisFirehoseRole -s bee7ch7/experiments/dev)

echo $VAR

RESULT=$(aws elbv2 describe-load-balancers --name aws --query LoadBalancers[0].CreatedTime --output text)
ALB_CREATED=${RESULT:0:10}
ALB_CREATED2=$(date -d ${RESULT:0:10} +%s)

TODAY=$(date +%F)
TODAY2=$(date -d $TODAY +%s)

echo $ALB_CREATED
echo $TODAY
echo $ALB_CREATED2 $TODAY2 $TODAY
if [[ "$ALB_CREATED2" -lt "$TODAY" ]]
then
  echo "Nothing to do"
  exit 0
fi

echo "UPDATE ROUTE53"

