#!/bin/bash

if [ $(helm list --namespace minio | wc -l) -eq 2 ]
then
  helm uninstall minio --namespace minio
fi

kubectl get namespace minio >& /dev/null

if [ $? -eq 0 ]
then
  kubectl delete namespace minio
fi