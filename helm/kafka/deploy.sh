#!/bin/bash

kubectl get namespace kafka >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace kafka
fi

helm repo add confluentinc https://confluentinc.github.io/cp-helm-charts/
helm repo update

if [ $(helm list --namespace kafka | wc -l) -eq 1 ]
then
  helm install kafka-cluster confluentinc/cp-helm-charts --namespace kafka -f ../values/values-kafka.yaml
fi
