#!/bin/bash

if [ $(helm list --namespace kafka | wc -l) -eq 2 ]
then
  helm uninstall kafka-cluster --namespace kafka
fi

kubectl delete namespace kafka