#!/bin/bash

#export JAVA_HOME=C:/Program Files/Java/jdk1.8.0_65
export PATH=${JAVA_HOME}/bin:${PATH}
export HADOOP_CLASSPATH=${JAVA_HOME}/lib/tools.jar

hadoop com.sun.tools.javac.Main src/MinMaxAveTemperature*.java
jar cf Assign2c.jar src/MinMaxAveTemperature*.class

hadoop jar Assign2c.jar src/MinMaxAveTemperature /user/cloudera/assign2/in /user/cloudera/assign2/outc
