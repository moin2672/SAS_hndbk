
DATA natparks;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Parks.dat';
INPUT Name $ 1-21 Type $ Region $ Museums Camping;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
TITLE 'Report with Character and Numeric Variables';
RUN;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
COLUMN Museums Camping;
TITLE 'Report with Only Numeric Variables';
RUN;

/*
Producing Simple Output with PROC REPORT

The REPORT procedure shares features with the PRINT, MEANS, TABULATE, and
SORT procedures and the DATA step

With all those features rolled into one procedure,
it’s not surprising that PROC REPORT can be complex—in fact entire books have been
written about it—but with all those features comes power

Here is the general form of a basic REPORT procedure:
			PROC REPORT NOWINDOWS;
				COLUMN variable-list;

COLUMN --> similar to a VAR statement in PROC PRINT; telling SAS which variables to include and in what order
	   --> If you leave out the COLUMN statement, SAS will, by default, include all the variables in your data set.

* If you leave out the NOWINDOWS option, SAS will open the interactive Report window
* By default, PROC REPORT prints your data immediately beneath the column headers, To
visually separate the headers and data, use the HEADLINE or HEADSKIP options like this:

				PROC REPORT NOWINDOWS HEADLINE HEADSKIP;

HEADLINE --> draws a line under the column headers
HEADSKIP --> puts a blank line beneath the column headers

Numeric versus character data
-----------------------------
The type of report you get from PROC REPORT depends, in part, on the type of data you use. 

If you have at least one character variable in your report, then, by default, you will get a detail report with one row per observation

If, on the other hand, your report includes only numeric variables, then, by default, PROC REPORT will sum those variables.

Even dates will be summed, by default, because they are numeric

Note:
-----
The Report window is a non-programming approach to using PROC REPORT. For more information see the SAS Help and
Documentation.

The HEADLINE and HEADSKIP options work only for the LISTING destination. If you send your output to another
destination such as HTML, SAS will ignore these options. See chapter 5 for an explanation of destinations.

You can override this default by assigning one of your numeric variables a usage type of DISPLAY in a DEFINE statement.
See section 4.18.



*/
