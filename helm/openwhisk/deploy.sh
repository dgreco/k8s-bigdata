#!/bin/bash

kubectl get namespace openwhisk >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace openwhisk
fi

kubectl label nodes --all openwhisk-role=invoker

if [ $(helm list --namespace openwhisk | wc -l) -eq 1 ]
then
  helm install openwhisk ./helm/openwhisk -n openwhisk -f ../values/values-openwhisk.yaml
fi
