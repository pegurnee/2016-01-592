## Hadoop
### Total points: 50

1. (20 pts.) Complete the following **Hadoop** course on EMU’s etraining site. You should first log in [here][1] and then go [this][2] page.  
You will need to pass the course (80% on the course test) to get full credit. Provide a screenshot of the confirmation page (should include your name).
1. (20 pts.) Implement the weather dataset problem from chapter 2 in the textbook, in Hadoop. You will not need to write any new code for this exercise. Complete the following tasks.
  - Understand the big data problem from chapter 2.
  - Copy the MapReduce java programs (`MaxTemperature`) from the textbook GitHub repository located [here][3]. Create a JAR file. Use a build tool, Maven is recommended. Follow the instructions on the site.
  - Download the weather dataset from the NCDC site located [here][4]. You could ftp the data to your local machine and then just copy it to the VM. Ideally, all weather data from 1901 to 2016 should be used for this exercise. But, this may take a long time for ftp and even longer to process using MapReduce. So, you will analyze the dataset that represents the first quarter of the 20th century only (1901 through 1925).
  - Unzip the data files and merge the data files from each year into one text file. This is to make HDFS happy. You should have 25 text files. Copy these files to HDFS.
  - Run the MapReduce program on this dataset. You program should output one value for each of the 25 years – max temperature.
  - Submit the details of the complete run of the program (including the command) and its output. Screenshots not required.
1. (10 pts.) Modify the `MaxTemperature` programs to not only print maximum but also the minimum and average of the data read. Name these programs `MinMaxAveTemp`. Submit the code for all three programs and the details of the complete run of the program (including the command) and its output. Screenshots not required.

[1]: https://it.emich.edu/etraining/login.cfm
[2]: https://emuetraining.skillport.com/skillportfe/assetSummaryPage.action?assetid=df_ahmr_a01_it_enus&fromShare=yes
[3]: https://github.com/tomwhite/hadoop-book/
[4]: ftp://ftp.ncdc.noaa.gov/pub/data/noaa/
