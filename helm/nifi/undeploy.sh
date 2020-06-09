#!/bin/bash

if [ $(helm list --namespace nifi | wc -l) -eq 2 ]
then
  helm uninstall nifi --namespace nifi
fi

kubectl get namespace nifi >& /dev/null

if [ $? -eq 0 ]
then
  kubectl delete namespace nifi
fi