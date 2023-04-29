#!/bin/bash
# cd ./k8s/helm

VAR=$(pulumi stack output kinesisFirehoseRole -s bee7ch7/experiments/dev)

echo $VAR

RESULT=$(aws elbv2 describe-load-balancers --name aws --query LoadBalancers[0].CreatedTime --output text)
ALB_CREATED=${RESULT:0:10}

TODAY=$(date +%F)
echo $ALB_CREATED
echo TODAY
if [[ "$ALB_CREATED" < "$TODAY" ]]
then
  echo "RUN ROUTE53 UPDATE"
else
  echo NOTHING TO DO
