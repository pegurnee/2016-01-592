#!/usr/bin/env bash

O_LOCATION=assign3/out1
REPORT="report.txt"
DIVIDER="________________\n"

hdfs dfs -get $O_LOCATION/p*

echo "$DIVIDER\nHead 10:" > $REPORT
head p*                   >> $REPORT
echo "$DIVIDER\nTail 10:" >> $REPORT
tail p*                   >> $REPORT

rm p*
