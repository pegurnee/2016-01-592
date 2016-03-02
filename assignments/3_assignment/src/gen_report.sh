#!/usr/bin/env bash

O_LOCATION=assign3/out1
REPORT="report.txt"

hdfs dfs -get $O_LOCATION/p*

echo "Head 10:" > $REPORT
head p*         >> $REPORT
echo "Tail 10:" >> $REPORT
tail p*         >> $REPORT

rm p*
