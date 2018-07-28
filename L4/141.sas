DATA orders;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Coffee.dat';
INPUT Coffee $ Window $ @@;
* Print tables for Window and Window by Coffee;
PROC FREQ DATA = orders;
TABLES Window Window * Coffee;
/*TABLES Window Window * Coffee / MISSING; (Including MISSING the d shows a count of 13 and previous statement shows 12, check it)*/
RUN;

/*
ABOUT PROGRAM

prints the frequency, percentage, percentage for that row, and percentage for that column; while
cumulative frequencies and percents appear along the right side and bottom. Notice that the
missing value is mentioned but not included in the statistics. (Use the MISSING option if you want
missing values to be included in the table.) Also, there is one observation with a value of Kon for
Coffee. This data entry error should be kon.


*/

/*
Counting Your Data with PROC FREQ

A frequency table is a simple list of counts answering the question “How many?”

		PROC FREQ;
		TABLES variable-combinations;

To produce a one-way frequency table, just list the variable name
EG:		TABLES YearsEducation;


To produce a cross-tabulation, list the variables separated by an asterisk
EG:		TABLES Sex * YearsEducation;

Options, if any, appear after a slash in the TABLES statement

For a list of statistical options for
PROC FREQ see section 8.3. Options for controlling the output of PROC FREQ include

LIST --> prints cross-tabulations in list format rather than grid
MISSING -->  includes missing values in frequency statistics
NOCOL -->  suppresses printing of column percentages in cross-tabulations
NOROW -->  suppresses printing of row percentages in cross-tabulations
OUT = data-set  --> writes a data set containing frequencies

The statement below, for instance, tells SAS to include missing values in the frequencies:
EG:		TABLES Sex * YearsEducation / MISSING;


*/
