#!/bin/bash

(cd ./helm/openebs;./deploy.sh)

echo deployed openebs ...

sleep 10

(cd ./helm/minio;./deploy.sh)

echo deployed minio ...

sleep 10

(cd ./helm/kafka;./deploy.sh)

echo deployed kafka ...

sleep 10

(cd ./helm/nifi;./deploy.sh)

echo deployed nifi ...

sleep 10

(cd ./helm/jupyterhub;./deploy.sh)

echo deployed jupyterhub ...





