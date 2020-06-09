#!/bin/bash

helm uninstall jupyterhub --namespace jupyterhub

kubectl delete namespace jupyterhub
