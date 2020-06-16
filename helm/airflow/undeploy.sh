#!/bin/bash

if [ $(helm list --namespace airflow | wc -l) -eq 2 ]
then
  helm uninstall airflow --namespace airflow
fi

kubectl get namespace airflow >& /dev/null

if [ $? -eq 0 ]
then
  kubectl delete namespace airflow
fi