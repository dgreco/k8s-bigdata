#!/bin/bash
(cd ./helm/airflow;./undeploy.sh)

(cd ./helm/jupyterhub;./undeploy.sh)

(cd ./helm/openwhisk;./undeploy.sh)

(cd ./helm/nifi;./undeploy.sh)

(cd ./helm/kafka;./undeploy.sh)

(cd ./helm/dremio;./undeploy.sh)

(cd ./helm/minio;./undeploy.sh)

(cd ./helm/openebs;./undeploy.sh)




