export APP_JAR=/home/cloudera/secondarysortfiles/secondary_sort.jar
INPUT=/secondary_sort/input
OUTPUT=/secondary_sort/output
hadoop fs -rm -r $OUTPUT
PROG=org.dataalgorithms.chap01.mapreduce.SecondarySortDriver
hadoop jar $APP_JAR $PROG $INPUT $OUTPUT
