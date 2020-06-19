#/bin/bash

../../../scripts/templater.sh Dockerfile.template -s -f ../../../config > Dockerfile

../../../scripts/templater.sh pb.sh.template -s -f ../../../config > pb.sh

sh ./pb.sh

rm ./pb.sh
