#!/bin/bash

if [ $(helm list --namespace cassandra-operator | wc -l) -eq 2 ]
then
  kubectl delete -f cassandra-cluster.yaml -n cassandra-operator
  helm uninstall cassandra-operator --namespace cassandra-operator
fi

kubectl get namespace cassandra-operator >& /dev/null

if [ $? -eq 0 ]
then
  kubectl delete namespace cassandra-operator
fi