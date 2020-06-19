#!/bin/bash

kubectl get namespace airflow >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace airflow
fi

kubectl create secret generic airflow-git-keys \
  --from-file=id_rsa=$HOME/.ssh/id_rsa \
  --from-file=id_rsa.pub=$HOME/.ssh/id_rsa.pub \
  --from-file=known_hosts=$HOME/.ssh/known_hosts --namespace airflow

../../scripts/templater.sh ../values/values-airflow.yaml.template -s -f ../../config > ../values/values-airflow.yaml

if [ $(helm list --namespace airflow | wc -l) -eq 1 ]
then
  helm install airflow stable/airflow -n airflow -f ../values/values-airflow.yaml
fi
