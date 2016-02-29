export STREAMING_FILES=/home/cloudera/secondarysortfiles
export STREAMING_JAR=/usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-2.6.0-mr1-cdh5.5.0.jar 
INPUT=/secondary_sort/input
OUTPUT=/secondary_sort/output
hadoop fs -rm -r $OUTPUT
hadoop jar $STREAMING_JAR \
-D stream.map.output.field.separator=\t \
-D stream.num.map.output.key.fields=3 \
-D mapred.text.key.partitioner.options=-k1,2 \
-D mapred.text.key.comparator.options=-n \
-files $STREAMING_FILES/mapper.py -files $STREAMING_FILES/reducer.py \
-mapper "python $STREAMING_FILES/mapper.py" -reducer    "python $STREAMING_FILES/reducer.py" \
-input $INPUT -output $OUTPUT \
-partitioner org.apache.hadoop.mapred.lib.KeyFieldBasedPartitioner
