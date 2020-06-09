#!/bin/bash

kubectl get namespace jupyterhub >& /dev/null

if [ $? -eq 1 ]
then
  kubectl create namespace jupyterhub
fi

helm install jupyterhub jupyterhub/jupyterhub --namespace jupyterhub --version=0.9.0 --values ../values/values-jupyterhub.yaml 
