## Hadoop Streaming with Python
###Total points: 40

1. (20 pts.) Implement the `WordCount` problem in Python. The following site provides a complete walkthrough of the Python program and how to implement it. You will NOT have to modify any code[i]. Use the three Gutenburg ebooks as suggested by the author for your inputs.  
[http://www.emunix.emich.edu/~sverdlik/COSC472/WritingAnHadoopMapReduceProgramInPython-MichaelG.Noll.html][mr-py-noll]
*Note:* You do not have to implement the last part – “Improved Mapper & Reducer code”.  
As the author mentions, the output includes double quotes and other characters which are part of the input text. So, “John” and John will be counted as two different words. Modify the `WordCount` program so that it removes all punctuation and special characters before the map reduce job. ~!@#$%^&*()_+{}|:”<>?-=\;,./  
Submit the following as text (screenshots not required):
  - Modified `Mapper` and `Reducer` classes
  - The first ten and the last ten lines of the output file. Use the `head` and `tail` commands in Linux to get this info.
  - Do NOT submit the entire `part-00000` file.
1. (15 pts.) Using the `WordCount` programs as a reference, implement the `WordLengthDistribution` problem in Python. Refer to the description of this problem in the MapReduce ppt – slides 29-31. Use the Gutenburg ebooks as inputs to test these programs. Submit the following as text (screenshots not required):
  - Modified `Mapper` and `Reducer` classes
  - `part-00000` file
1. (5 pts.) Comment on your output. Is the output exactly as you had expected? If not, what do you observe. Why is it happening? Can it be fixed? Explain briefly.

[i] You will need to make a slight modification in the run command. Use this instead.

[cloudera@quickstart ~]$ hadoop jar /usr/lib/hadoop-0.20-mapreduce/contrib/streaming/hadoop-streaming-mr1.jar -file mapper.py -mapper mapper.py -file reducer.py -reducer reducer.py -input gutenburg/* -output gutenburgoutput

[mr-py-noll]: http://www.emunix.emich.edu/~sverdlik/COSC472/WritingAnHadoopMapReduceProgramInPython-MichaelG.Noll.html
