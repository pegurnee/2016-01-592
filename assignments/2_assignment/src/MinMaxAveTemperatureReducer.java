package src;

// cc MaxTemperatureReducer Reducer for maximum temperature example
// vv MaxTemperatureReducer
import java.io.IOException;

import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

public class MinMaxAveTemperatureReducer
  extends Reducer<Text, IntWritable, Text, Text> {

  @Override
  public void reduce(Text key, Iterable<IntWritable> values,
      Context context)
      throws IOException, InterruptedException {

    
    int minValue = Integer.MAX_VALUE;
    int maxValue = Integer.MIN_VALUE;
    int total = 0;
    int count = 0;
    for (IntWritable value : values) {
      int theValue = value.get();
      maxValue = Math.max(maxValue, theValue);
      minValue = Math.min(minValue, theValue);
      total += theValue;
      count++;
    }

    context.write(key, new Text(String.format("Min: %d; Max: %d; Ave: %f;", minValue, maxValue, total / (double)count)));
  }
}
// ^^ MaxTemperatureReducer
