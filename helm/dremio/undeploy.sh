#!/bin/bash

if [ $(helm list --namespace dremio | wc -l) -eq 2 ]
then
  helm uninstall dremio --namespace dremio
fi

kubectl get namespace dremio >& /dev/null

if [ $? -eq 0 ]
then
  kubectl delete namespace dremio
fi