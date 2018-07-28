DATA reading;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Books1.dat' DLM = '09'X;
INPUT Name $ Week1 Week2 Week3 Week4 Week5;
PROC PRINT DATA=reading;
RUN;

/*

Delimited files are raw data files that have a special
character separating data values.
SAS gives you two options for the INFILE
statement that make it easy to read delimited data files: the
DLM= option and the DSD option.
The DLM= option If you read your data using list input, the DATA step expects your file
to have spaces between your data values. The DELIMITER=, or DLM=, option in the INFILE
statement allows you to read data files with other delimiters.

78b
----
The comma and tab characters are
common delimiters found in data files, but you could read data files with any delimiter character
by just enclosing the delimiter character in quotation marks after the DLM= option (i.e.,
DLM='&').

If the same data had tab characters between values instead of commas, then you could use the
following program to read the file. This program uses the DLM='09'X option. In ASCII, 09 is the
hexadecimal equivalent of a tab character, and the notation '09'X means a hexadecimal 09. If
your computer uses EBCDIC (IBM mainframes) instead of ASCII, then use DLM='05'X.

By default, SAS interprets two or more delimiters in a row as a single delimiter. If your file has
missing values, and two delimiters in a row indicate a missing value, then you will also need the
DSD option in the INFILE statement.

*/
