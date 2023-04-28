#!/bin/bash
cd ./k8s/helm

VAR=$(pulumi stack output kinesisFirehoseRole -s bee7ch7/experiments/dev)

echo $VAR
