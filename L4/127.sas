
DATA sales;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Candy.dat';
INPUT Name $ 1-11 Class @15 DateReturned MMDDYY10. CandyType $
Quantity;
Profit = Quantity * 1.25;
PROC SORT DATA = sales;
BY Class;
PROC PRINT DATA = sales;
BY Class;
SUM Profit;
VAR Name DateReturned CandyType Profit;
TITLE 'Candy Sales for Field Trip by Class';
RUN;

/*
Printing Your Data with PROC PRINT

PROC PRINT;

PROC PRINT DATA = data-set;

PROC PRINT DATA = data-set NOOBS LABEL;

The following are optional statements that sometimes come in handy:
* BY variable-list; 
The BY statement starts a new section in the output for each
new value of the BY variables and prints the values of the BY
variables at the top of each section. The data must be presorted
by the BY variables.

* ID variable-list; 
When you use the ID statement, the observation numbers are not
printed. Instead, the variables in the ID variable list appear on
the left-hand side of the page.

* SUM variable-list; The SUM statement prints sums for the variables in the list.

* VAR variable-list; The VAR statement specifies which variables to print and the
order. Without a VAR statement, all variables in the SAS

*/
