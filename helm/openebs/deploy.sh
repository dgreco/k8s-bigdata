#!/bin/bash

kubectl get namespace openebs >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace openebs
fi
helm repo update
helm install openebs stable/openebs --namespace openebs -f ../values/values-openebs.yaml
