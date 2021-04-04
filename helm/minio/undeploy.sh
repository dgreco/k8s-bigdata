#!/bin/bash

if [ $(helm list --namespace minio-operator | wc -l) -eq 2 ]
then
  helm uninstall minio-operator --namespace minio-operator
fi

kubectl get namespace minio-operator >& /dev/null

if [ $? -eq 0 ]
then
  kubectl delete namespace minio-operator
fi