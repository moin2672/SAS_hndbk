DATA boats;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Boats.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-36;
* Tabulations with three dimensions;
PROC TABULATE DATA = boats;
CLASS Port Locomotion Type;
TABLE Port, Locomotion, Type;
TITLE 'Number of Boats by Port, Locomotion, and Type';
RUN;

/*
Producing Tabular Reports with PROC TABULATE
Every summary statistic the TABULATE procedure computes can also be produced
by other procedures such as PRINT, MEANS, and FREQ

but PROC TABULATE is
popular because its reports are pretty. If TABULATE were a box, it would be giftwrapped.


If you find the
syntax of PROC TABULATE a little hard to get used to, that may be because it has
roots outside of SAS.

The general form of PROC TABULATE is
		PROC TABULATE;
			CLASS classification-variable-list;
			TABLE page-dimension, row-dimension, column-dimension;


CLASS --> tells SAS which variables contain categorical data to be used for dividing
observations into groups. 

If a variable is listed in a CLASS statement, then, by default, PROC
TABULATE produces simple counts of the number of observations in each category of that
variable.


TABLE --> tells SAS how to organize your table and
what numbers to compute. 

Each TABLE statement defines only one table, but you may have
multiple TABLE statements


Dimensions
----------
Each TABLE statement can specify up to three dimensions. Those dimensions,
separated by commas,

		"pages, rows, and columns"


If you specify only "one dimension", then that becomes, by default, the "column dimension".
If you specify "two dimensions", then you get "rows and columns"
If you specify "three dimensions", then you get "pages, rows, and columns".

Notice that the order of dimensions in the TABLE
statement is page, then row, then column.

Missing data
------------
By default, observations are excluded from tables if they have missing values
for variables listed in a CLASS statement

If you want to keep these observations, then simply
add the MISSING option to your PROC statement like this:

			PROC TABULATE MISSING;










*/
