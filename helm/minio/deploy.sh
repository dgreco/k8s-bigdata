#!/bin/bash

kubectl get namespace minio >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace minio
fi

helm repo update

if [ $(helm list --namespace minio | wc -l) -eq 1 ]
then
  helm install minio stable/minio -f ../values/values-minio.yaml --namespace minio
fi
