#!/usr/bin/env bash


O_LOCATION="assign3/out$1"
REPORT="report_$1.txt"
DIVIDER="________________\n"

hdfs dfs -get $O_LOCATION/p*

echo -e "$DIVIDER\nHead 10:"  > $REPORT
head p*                       >> $REPORT
echo -e "$DIVIDER\nTail 10:"  >> $REPORT
tail p*                       >> $REPORT

rm p*
