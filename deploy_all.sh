#!/bin/bash

(cd ./helm/values;./render_template.sh)

(cd ./helm/openebs;./deploy.sh)

echo deployed openebs ...

sleep 10

(cd ./helm/minio;./deploy.sh)

echo deployed minio ...

sleep 10

(cd ./helm/dremio;./deploy.sh)

echo deployed dremio ...

sleep 10

(cd ./helm/kafka;./deploy.sh)

echo deployed kafka ...

sleep 10

(cd ./helm/nifi;./deploy.sh)

echo deployed nifi ...

sleep 10

(cd ./helm/openwhisk;./deploy.sh)

echo deployed openwhisk ...






