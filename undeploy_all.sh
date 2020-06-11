#!/bin/bash
(cd ./helm/jupyterhub;./jupyterhub.sh)

(cd ./helm/openwhisk;./undeploy.sh)

(cd ./helm/nifi;./undeploy.sh)

(cd ./helm/kafka;./undeploy.sh)

(cd ./helm/dremio;./undeploy.sh)

(cd ./helm/minio;./undeploy.sh)

(cd ./helm/openebs;./undeploy.sh)




