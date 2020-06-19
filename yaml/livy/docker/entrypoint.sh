#!/bin/bash

export SPARK_DIST_CLASSPATH=$($HADOOP_HOME/bin/hadoop classpath)

/opt/livy/bin/livy-server start
tail -f /dev/null
