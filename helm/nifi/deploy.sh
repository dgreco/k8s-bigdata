#!/bin/bash

kubectl get namespace nifi >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace nifi
fi

helm repo add cetic https://cetic.github.io/helm-charts
helm repo update

if [ $(helm list --namespace nifi | wc -l) -eq 1 ]
then
  helm install nifi cetic/nifi --namespace nifi -f ../values/values-nifi.yaml
fi
