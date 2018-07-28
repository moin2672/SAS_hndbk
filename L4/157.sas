DATA natparks;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Parks.dat';
INPUT Name $ 1-21 Type $ Region $ Museums Camping;
* Region and Type as GROUP variables;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
COLUMN Region Type Museums Camping;
DEFINE Region / GROUP;
DEFINE Type / GROUP;
TITLE 'Summary Report with Two Group Variables';
RUN;
* Region as GROUP and Type as ACROSS with sums;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
COLUMN Region Type,(Museums Camping);
DEFINE Region / GROUP;
DEFINE Type / ACROSS;
TITLE 'Summary Report with a Group and an Across Variable';
RUN;


/*
Creating Summary Reports with PROC REPORT

Two different usage types cause the REPORT procedure to “roll up” data into summary groups
based on the values of a variable

While the 
GROUP usage type --> produces summary rows, the
ACROSS usage type -->  produces summary columns

Group variables
---------------
Defining a group variable is fairly simple. Just specify the GROUP usage
option in a DEFINE statement

By default, analysis variables will be summed

For Example,
		PROC REPORT DATA = employees NOWINDOWS;
			COLUMN Department Salary Bonus;
			DEFINE Department / GROUP;

Across variables
----------------
To define an across variable, you also use a DEFINE statement

by default SAS produces counts rather than sums.

--> To obtain sums2 for across variables, you must
tell SAS which variables to summarize.
--> You do that by putting a comma between the across
variable and analysis variable (or variables if you enclose them in parentheses).

For Example,
The following
PROC REPORT tells SAS to produce a report showing the sum of Salary and of Bonus with one
column for each value of Department.

			PROC REPORT DATA = employees NOWINDOWS;
				COLUMN Department , (Salary Bonus);
				DEFINE Department / ACROSS;







*/
