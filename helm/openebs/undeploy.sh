#!/bin/bash

helm uninstall openebs --namespace openebs

kubectl delete namespace openebs

for i in `kubectl get crd | grep openebs | awk '{ print $1 }'` ; do kubectl delete crd  $i; done

for i in `kubectl get crd | grep external-storage.k8s.io | awk '{ print $1 }'` ; do kubectl delete crd  $i; done

for i in `kubectl get storageclass | grep openebs | awk '{ print $1 }'` ; do kubectl delete storageclass  $i; done
