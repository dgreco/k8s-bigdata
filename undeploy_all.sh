#!/bin/bash
(cd ./helm/jupyterhub;./undeploy.sh)

(cd ./helm/nifi;./undeploy.sh)

(cd ./helm/kafka;./undeploy.sh)

(cd ./helm/minio;./undeploy.sh)

(cd ./helm/openebs;./undeploy.sh)




