#!/bin/bash

kubectl get namespace openebs >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace openebs
fi

../../scripts/templater.sh ../values/values-openebs.yaml.template -s -f ../../config > ../values/values-openebs.yaml

helm repo add openebs https://openebs.github.io/charts
helm repo update
helm install openebs openebs/openebs --namespace openebs -f ../values/values-openebs.yaml
