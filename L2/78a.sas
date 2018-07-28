DATA reading;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Books.dat' DLM = ',';
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

*/
