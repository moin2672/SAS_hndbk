DATA natparks;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Parks.dat';
INPUT Name $ 1-21 Type $ Region $ Museums Camping;
*Statistics in COLUMN statement with two group variables;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
COLUMN Region Type N (Museums Camping),MEAN;
DEFINE Region / GROUP;
DEFINE Type / GROUP;
TITLE 'Statistics with Two Group Variables';
RUN;
*Statistics in COLUMN statement with group and across variables;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
COLUMN Region N Type,(Museums Camping),MEAN;
DEFINE Region / GROUP;
DEFINE Type / ACROSS;
TITLE 'Statistics with a Group and Across Variable';
RUN;

/*
Adding Statistics to PROC REPORT Output

This is a little like requesting statistics in a TABLE statement in PROC TABULATE, except that
instead of using an asterisk to cross a statistics keyword with a variable, you use a comma


PROC REPORT can produce all the same statistics as PROC TABULATE and PROC
MEANS because it uses the same internal engine to compute those statistics


MAX --> highest value
MIN --> lowest value
MEAN --> the arithmetic mean
MEDIAN --> the median
N --> number of non-missing values
NMISS --> number of missing values
P90 --> the 90th percentile
PCTN --> the percentage of observations for that group
PCTSUM --> the percentage of a total sum represented by that group
STD --> the standard deviation
SUM --> the sum

Applying statistics to variables
--------------------------------
To request a statistic for a particular variable, insert a
comma between the statistic and variable in the COLUMN statement. One statistic, N, does not
require a comma because it does not apply to a particular variable. If you insert N in a COLUMN
statement, then SAS will print the number of observations that contributed to that row of the
report. This statement tells SAS to print two columns of data: the median of a variable named
Age, and the number of observations in that row.

			COLUMN Age,MEDIAN N;

To request multiple statistics or statistics for multiple variables, put parentheses around the
statistics or variables. This statement uses parentheses to request two statistics for the variable Age,
and then requests one statistic for two variables, Height and Weight.

			COLUMN Age,(MIN MAX) (Height Weight),MEAN;





*/
