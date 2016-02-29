EXPLANATION OF CONTENTS:

=========================================
book_code_pom_file/pom.xml
=========================================
This is an altered pom.xml file for the book code.

To setup an eclipse maven project for the book code:

1. Open a terminal and navigate to where you want to download the repo;
enter command -> git clone https://github.com/mahmoudparsian/data-algorithms-book.git

2. Open eclipse and choose File -> Import -> Existing Maven Projects. Select the folder 
that you just downloaded with git.

3. Replace the pom.xml in the eclipse project with the book_code_pom_file/pom.xml file




=========================================
card_count_eclipse_maven_project/
=========================================

This is an eclipse maven project for the card counting example I demoed in class. 
The github repo it's hosted at is https://github.com/eljefe6a/UnoExample. 
Perl, Ruby, and Python scripts for streaming mapreduce versions of this project
can also be found in the github repo.

To import the eclipse project of the above repo that I have assembled:
----------------------------------------------------------------------
1. From Eclipse choose File -> Import -> Existing Projects into Eclipse



=========================================
secondarysortfiles/
=========================================

secondarysort.jar - compiled jar file from chapter 1 of the book code
stream.sh - a shell script to run the jar file on the virtual cluster
sample_input.txt - input for the mapreduce job
mapper.py - an equivalent python mapper for streaming mapreduce
reducer.py - an equivalent python reducer for streaming mapreduce


To test the pure java mapreduce job:
------------------------------------
1. In eclipse, double click on the SecondarySortDriver.java file from chapter 1 package
	and click the green run button. It will crash, asking for input and output files
2. Right click on the file and select -> Run as Configurations. It should pull up the configuration
	from the crashed run. In the argument tabs, add sample_input.txt, and output. Click apply, 
	and close.
3. The sample_input.txt file and the output/ folder must be included in the top level of the 
	eclipse project folder
4. Click the run button again
5. Refresh the project folder and verify that the file was written the the output/ folder


To test the python streaming mapreduce job:
-------------------------------------------
1. In a terminal type -> cat | python mapper.py | sort -k1,2 -k3n | reducer.py


To run either of the mapreduce jobs:
------------------------------------
1. Make the folders on hadoop and then upload the input file
hadoop fs -mkdir secondarysort/
hadoop fs -mkdir secondarysort/input
hadoop fs -put sample_input.txt secondarysort/input

2. Launch one of the scripts
./stream.sh #for streaming mapreduce or...
./run.sh #for regular mapreduce

3. Verify the results
hadoop fs -cat secondarysort/output/p*
