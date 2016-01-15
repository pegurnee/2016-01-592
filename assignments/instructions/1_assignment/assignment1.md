## SQL

### Total points: 60

Consider EMU enrollment data included below. Two versions are provided for your use. The [first zip file is an Excel spreadsheet][1] with multiple sheets of data. The [second zip file includes a folder of csv files][2] with data from individual sheets.

Create a database schema to hold this information in a DBMS of your choice. `SQLite` is a good option. Note that each sheet/csv would map to individual tables in your database. Make sure to set primary keys, foreign keys, not null, and other relevant constraints on the tables. Populate the database with the data included. Write queries on the database to determine the following:

1. How many fully online classes (DEO) were offered each year? List the year and count for all 10 years.
1. Find the top 10 classes, in terms of enrollment, offered in Fall 2015. List titles and enrollments only.
1. Find the enrollment trend in COSC 111 (all classes) during the 10 years. List year and total enrollment.
1. Find the total credit hour production for each department in the College of Arts and Sciences in Fall 2015.
1. What was the net income, from tuition, for the College of Business during Fall 2015? The resident tuition per credit hour is $296.65 for “UG” classes and $597.00 for “GR” classes for the academic year.
1. A query of your choice which produces meaningful data. Specify what you are trying to retrieve with your query.

The following points are noteworthy regarding the dataset:

- A class refers to one section of a course.
- A year includes fall and winter semesters. Summer classes are not included in this dataset.
- The term code includes the year that the academic year ends in. So the term code for Fall 2013 is 201410 and Winter 2014 is 201420.
- Credit hour production for a class is the product of credit hours and enrollment.

#### Deliverables

Submit the following to Canvas. You may submit `txt`, `pdf`, and/or `jpg` files.

- DDL statements for the database schema
- SQL statements and results for the above queries

#### Extra credit

See below for an interesting problem from Dr. Ross. Up to 10 points will be awarded depending on the sophistication of your solution.

Produce a table that shows the # of students who are in classes on the main campus (presuming 100% attendance), every 5 minutes throughout the day, on Tuesdays. Your table might look something like this:

| Day  | Time   | #enrolled |
| ---- | ------ | --------- |
| Tue  | 00:05  | 0
| Tue  | 00:10  | 0

(etc)

| Day  | Time   | #enrolled |
| ---- | ------ | --------- |
| Tue  | 08:00  | 1521
| Tue  | 08:05  | 1521
| Tue  | 08:10  | 1521

(etc.)

This would help us estimate the demand for parking on or near campus.

[1]: src/EMU_enrollment_2005_2015.zip
[2]: src/enrollment_csv.zip
