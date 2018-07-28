DATA sales;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Flowers.dat';
INPUT CustomerID $ @9 SaleDate MMDDYY10. Petunia SnapDragon
Marigold;
Month = MONTH(SaleDate);
PROC SORT DATA = sales;
BY Month;
* Calculate means by Month for flower sales;
PROC MEANS DATA = sales;
BY Month;
VAR Petunia SnapDragon Marigold;
TITLE 'Summary of Flower Sales by Month';
RUN;



/*
Summarizing Your Data Using PROC MEANS

The MEANS procedure provides simple statistics on numeric variables.

			PROC MEANS options;

There are over 30 different statistics you can request with the MEANS procedure.

The following is a list of some of the simple statistics.

More options for the MEANS procedure are discussed in section 8.2.

MAX --> the maximum value
MIN --> the minimum value
MEAN --> the mean
MEDIAN --> the median
N --> number of non-missing values
NMISS --> number of missing values
RANGE --> the range
STDDEV --> the standard deviation
SUM --> the sum

Some of the optionalstatements you may want to use: 

BY variable-list; --> The BY statement performs separate analyses for each
level of the variables in the list.1 The data must first be
sorted in the same order as the variable-list. (You can use
PROC SORT to do this.)

CLASS variable-list; -->  The CLASS statement also performs separate analyses
for each level of the variables in the list, 1 but its output
is more compact than with the BY statement, and the
data do not have to be sorted first.

VAR variable-list; -->  The VAR statement specifies which numeric variables to
use in the analysis. If it is absent then SAS uses all
numeric variables.

Note:
* By default, observations are excluded if they have missing values for BY or CLASS variables. 
* If you want to include missing values, add the MISSING option to the PROC MEANS statement.





*/
