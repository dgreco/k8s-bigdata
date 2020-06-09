#!/bin/bash

if [ $(helm list --namespace openwhisk | wc -l) -eq 2 ]
then
  helm uninstall openwhisk --namespace openwhisk
fi

kubectl get namespace openwhisk >& /dev/null

if [ $? -eq 0 ]
then
  kubectl delete namespace openwhisk
fi