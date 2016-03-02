#!/usr/bin/env bash

I_LOCATION=assign3/in
O_LOCATION=assign3/out1

S_LOCATION=src
STREAM_JAR=/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-mr1.jar

hdfs dfs -rm -r $O_LOCATION

hadoop jar $STREAM_JAR \
-file $S_LOCATION/a-mapper.py -mapper $S_LOCATION/a-mapper.py \
-file $S_LOCATION/a-reducer.py -reducer $S_LOCATION/a-reducer.py \
-input $I_LOCATION/* -output $O_LOCATION

bash src/gen_report.sh
