#!/bin/bash
for i in *.yaml.template 
do 
  echo rendering $i;
  ../../scripts/templater.sh $i -s -f ../../config > `basename $i .template`
done