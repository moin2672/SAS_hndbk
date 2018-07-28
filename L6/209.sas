/*Tracking and Selecting Observations with the IN= Option

When you combine two data sets, you can use
IN= options to track which of the original data sets
contributed to each observation in the new data set


The IN= data set option can be used any time you read
a SAS data set in a DATA step—with SET, MERGE, or
UPDATE—but is most often used with MERGE.


To use the IN= option, you simply put the option in parentheses directly following the data set you
want to track, and specify a name for the IN= variable

The names of IN= variables must follow standard SAS naming conventions
— start with a letter or underscore; 
— be 32 characters or fewer in length; and 
— contain only letters, numerals, or underscores.

The DATA step below creates a data set named BOTH by merging two data sets named STATE
and COUNTY. Then the IN= options create two variables named InState and InCounty:

		DATA both;
			MERGE state (IN = InState) county (IN = InCounty);
			BY StateName;

Unlike most variables, IN= variables are temporary, existing only during the current DATA step.

SAS gives the IN= variables a value of 0 or 1. A value of 1 means that data set did contribute to
the current observation, and a value of 0 means the data set did not contribute.

Suppose the
COUNTY data set above contained no data for Louisiana. (Louisiana has parishes, not counties.)

In that case, the BOTH data set would contain one observation for Louisiana which would have a
value of 1 for the variable InState and a value of 0 for InCounty because the STATE data set
contributed to that observation, but the COUNTY data set did not.

You can use this variable like any other variable in the current DATA step, but it is most often
used in subsetting IF or IF-THEN statements such as these

Subsetting IF: 
--------------
IF InState = 1;
IF InCounty = 0;
IF InState = 1 AND InCounty = 1;
IF-THEN: 
--------
IF InCounty = 1 THEN Origin = 1;
IF InState = 1 THEN State = 'Yes';



*/

DATA customer;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\Address.dat' TRUNCOVER;
INPUT CustomerNumber Name $ 5-21 Address $ 23-42;
DATA orders;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\OrdersQ3.dat';
INPUT CustomerNumber Total;
PROC SORT DATA = orders;
BY CustomerNumber;
* Combine the data sets using the IN= option;
DATA noorders;
MERGE customer orders (IN = Recent);
BY CustomerNumber;
IF Recent = 0;
PROC PRINT DATA = noorders;
TITLE 'Customers with No Orders in the Third Quarter';
RUN;
