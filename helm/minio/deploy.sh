#!/bin/bash

kubectl get namespace minio-operator >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace minio-operator
fi

../../scripts/templater.sh ../values/values-minio.yaml.template -s -f ../../config > ../values/values-minio.yaml

helm repo add minio https://operator.min.io/
helm repo update

if [ $(helm list --namespace minio-operator | wc -l) -eq 1 ]
then
  helm install --namespace minio-operator --create-namespace minio-operator minio/minio-operator  -f ../values/values-minio.yaml
  kubectl get secret $(kubectl get serviceaccount console-sa --namespace minio-operator -o jsonpath="{.secrets[0].name}") --namespace minio-operator -o jsonpath="{.data.token}" | base64 --decode
fi
