#!/usr/bin/env bash

I_LOCATION=assign3/out$1
O_LOCATION=assign3/out$1b

S_LOCATION=src
STREAM_JAR=/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-mr1.jar

hdfs dfs -rm -r $O_LOCATION

hadoop jar $STREAM_JAR \
-D mapreduce.job.output.key.comparator.class=org.apache.hadoop.mapred.lib.KeyFieldBasedComparator \
-D mapreduce.partition.keycomparator.options=-n \
-file $S_LOCATION/c-mapper.py   -mapper $S_LOCATION/c-mapper.py \
-file $S_LOCATION/c-reducer.py  -reducer $S_LOCATION/c-reducer.py \
-input $I_LOCATION/*            -output $O_LOCATION

bash src/gen_report.sh $1b
