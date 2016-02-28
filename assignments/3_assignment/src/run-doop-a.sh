#!/usr/bin/env bash


hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-mr1.jar -file mapper.py-mapper mapper.py -file reducer.py -reducer reducer.py -input assign3/in/* -output assign3/out1
