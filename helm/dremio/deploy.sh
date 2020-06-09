#!/bin/bash

kubectl get namespace dremio >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace dremio
fi

if [ $(helm list --namespace dremio | wc -l) -eq 1 ]
then
  helm install dremio . -f ../values/values-dremio.yaml --namespace dremio
fi
