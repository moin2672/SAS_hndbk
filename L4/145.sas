DATA boats;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Boats.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-36;
* Tabulations with two dimensions and statistics;
PROC TABULATE DATA = boats;
CLASS Locomotion Type;
VAR Price;
TABLE Locomotion ALL, MEAN*Price*(Type ALL);
TITLE 'Mean Price by Locomotion and Type';
RUN;

/*
Adding Statistics to PROC TABULATE Output

By default, PROC TABULATE produces simple counts for variables listed in a CLASS statement

but you can request many other statistics in a TABLE statement

You can also concatenate or
cross variables within dimensions.

In fact, you can write TABLE statements so complicated that
even you won’t know what the report is going to look like until you run it.

* While the CLASS statement lists categorical variables

* the VAR statement tells SAS which variables contain continuous data

Here is the general form:
		PROC TABULATE;
			VAR analysis-variable-list;
			CLASS classification-variable-list;
			TABLE page-dimension, row-dimension, column-dimension;

* You may have both a CLASS statement and a VAR statement, or just one, but all variables listed
in a TABLE statement must also appear in either a CLASS or a VAR statement.


Keywords
--------
ALL --> adds a row, column, or page showing the total
MAX --> highest value
MIN --> lowest value
MEAN --> the arithmetic mean
MEDIAN --> the median
N --> number of non-missing values
NMISS --> number of missing values
P90 --> the 90th percentile
PCTN --> the percentage of observations for that group
PCTSUM --> the percentage of a total sum represented by that group
STDDEV --> the standard deviation
SUM --> the sum


Concatenating, crossing, and grouping
-------------------------------------
Within a dimension, variables and keywords
can be concatenated, crossed, or grouped.


* To concatenate variables or keywords simply list them
separated by a space, 
---> The keyword ALL is generally
concatenated.

* to cross variables or keywords separate then with an asterisk (*),

* to group them enclose the variables or keywords in parentheses

Concatenating: TABLE Locomotion Type ALL;
Crossing: TABLE MEAN * Price;
Crossing, grouping, and concatenating: TABLE PCTN *(Locomotion Type);




*/
