#!/bin/bash

kubectl get namespace cassandra-operator >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace cassandra-operator
fi

../../scripts/templater.sh ../values/values-cassandra.yaml.template -s -f ../../config > ../values/values-cassandra.yaml

helm repo add datastax https://datastax.github.io/charts
helm repo update

if [ $(helm list --namespace cassandra-operator | wc -l) -eq 1 ]
then
  helm install --namespace cassandra-operator cassandra-operator datastax/cass-operator -f ../values/values-cassandra.yaml
  sleep 30
  kubectl --namespace cassandra-operator create -f cassandra-cluster.yaml
  while [ $(kubectl -n cassandra-operator get cassdc/dc1 -o "jsonpath={.status.cassandraOperatorProgress}") != "Ready" ]; do
    sleep 1
  done
  CASS_USER=$(kubectl -n cassandra-operator get secret cluster1-superuser -o json | jq -r '.data.username' | base64 --decode)
  CASS_PASS=$(kubectl -n cassandra-operator get secret cluster1-superuser -o json | jq -r '.data.password' | base64 --decode)
  echo $CASS_USER
  echo $CASS_PASS
fi
