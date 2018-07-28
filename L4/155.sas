DATA natparks;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Parks.dat';
INPUT Name $ 1-21 Type $ Region $ Museums Camping;
* PROC REPORT with ORDER variable, MISSING option, and column header;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE MISSING;
COLUMN Region Name Museums Camping;
DEFINE Region / ORDER;
DEFINE Camping / ANALYSIS 'Camp/Grounds';
TITLE 'National Parks and Monuments Arranged by Region';
RUN;


/*
Using DEFINE Statements in PROC REPORT

The DEFINE statement is a general purpose statement that specifies options for an individual
variable.

			DEFINE variable / options ’column-header’;

In a DEFINE statement, you specify the variable name followed by a slash and any options for
that particular variable


Usage Options
-------------
ACROSS ---> creates a column for each unique value of the variable.
ANALYSIS ---> calculates statistics for the variable. This is the default usage for numeric
variables, and the default statistic is sum.
DISPLAY ---> creates one row for each observation in the data set. This is the default usage
for character variables.
GROUP ---> creates a row for each unique value of the variable.
ORDER ---> creates one row for each observation with rows arranged according to the
values of the order variable.

Changing column headers
-----------------------
There are several ways to change column headers in PROC REPORT including 
1. using a LABEL statement as described in section 4.1,
2. specifying a column header in a DEFINE statement

Using a slash in a column header tells SAS to split the header at that point.

			DEFINE Age / ORDER 'Age at/Admission';

Missing data
------------
By default, observations are excluded from reports if they have missing values
for order, group, or across variables. If you want to keep these observations, then simply add the
MISSING option to your PROC statement like this:

			PROC REPORT NOWINDOWS MISSING;

Note
----
1. Another usage type is COMPUTED. See the SAS Help and Documentation for more information.
2. In addition to the LABEL and DEFINE statements, you can change column headers in the COLUMN statement which allows
you to create spanning headers. See the SAS Help and Documentation for more information.
3. At the time this book was written, PROC REPORT did not automatically split mixed case variable names the way most
procedures do.





*/
