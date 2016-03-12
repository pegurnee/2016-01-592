## Big data ethics and Spark (PageRank & Linear Regression)
### Total Points: 35

1. (15 pts.) Read the following two references regarding big data ethics.
Ethics for big data analytics - http://www.ibmbigdatahub.com/sites/default/files/whitepapers_reports_file/TCG%20Study%20Report%20-%20Ethics%20for%20BD%26A.pdf
Example “big data” research controversies – http://bdes.datasociety.net/council-output/example-big-data-research-controversies/
Write a 1-page report on your findings. Address the following in your report.
  - (5 pts.) Summarize the first paper in a paragraph.
  - (3 pts.) The first paper recommends nine implications that organizations need to consider when doing big data analytics. Add one more of your own to this list and explain briefly what it is.
  - (7 pts.) From the second paper, pick one controversy of your liking and its associated topic (there are 5 in total). Summarize in a paragraph what the controversy was and its associated topic. Associate it with at least 3 implications from the first paper and discuss why you made these associations.
2. (20 pts.) Download and install Apache Spark - http://spark.apache.org/downloads.html. This can be done in Cloudera or your laptop. Spark can be run stand-alone. It comes with a number of sample programs. Execute the following programs. You could use any one of the Python, Java or Scala versions.
  1. PageRank (the name of the Python file is pagerank.py)
    Run this program on a small dataset found on this page:
    http://webdatacommons.org/hyperlinkgraph/#toc3 - go to section 3.1 on this page and download the two example files.
    Use the example_arc file as your input to PageRank and run the program for 10 iterations.
    Submit the following:
    - (5 pts.) Explain briefly what this program does on this dataset. Cut and paste the output of the program (only the data produced by the program, please!)
    - (10 pts.) Now, modify the program so that it writes the output to a file. Observe that it generates multiple part-00000 files. Change the program so that it writes to one part-00000 file. Also, sort the data based on the key. Cut and paste the contents of the output file. Submit your source code too.
    - (5 extra credit points) Use the example_index file, in the program, to change your output to include website names instead of numbers.
  1. Linear Regression (the name of the Python file is regression_metrics_example.py)
  Run this program. It reads input from a sample file that is included in the Spark download.
  (5 pts.) Explain briefly what this program does on this dataset. Cut and paste the output of the program (only the data produced by the program, please!)
