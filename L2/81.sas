PROC IMPORT DATAFILE ='C:\Users\448513\Documents\My SAS Files\9.1\L1\Bands1.csv' OUT = music REPLACE;
PROC PRINT DATA = music;
TITLE 'Customers at Each Gig';
RUN;

/*
Reading Delimited Files with the IMPORT Procedure
PROC IMPORT does for you that make it easy to read certain types
of data files.
PROC IMPORT will scan your data file and automatically determine the variable
types (character or numeric), will assign proper lengths to the character variables, and can
recognize some date formats.
PROC IMPORT will treat two consecutive delimiters in your data
file as a missing value, will read values enclosed by quotation marks, and assign missing values to
variables when it runs out of data on a line.
PROC IMPORT DATAFILE = 'filename' OUT = data-set;
where the file you want to read follows the DATAFILE= option, and the name of the SAS data set
you want to create follows the OUT= option. SAS will determine the file type by the extension of
the file as shown in the following table.
Type of File Extension DBMS Identifier
Comma-delimited .csv CSV
Tab-delimited .txt TAB
Delimiters other than commas or tabs DLM

NOTE
-------
* If your file does not have the proper extension
or your file is of type DLM, then you must use
the DBMS= option in the PROC IMPORT statement

Use the REPLACE option if you already have
a SAS data set with the name you specified in the OUT= option, and you want to overwrite it.

PROC IMPORT DATAFILE = 'filename' OUT = data-set
DBMS = identifier REPLACE;

IMPORT procedure will, by default, get variable names from the first line in your data file

* "	If you do not want this,
add the GETNAMES=NO statement after the PROC IMPORT statement.

* If you have a different delimiter, then specify it in the DELIMITER= statement
PROC IMPORT DATAFILE = 'filename' OUT = data-set
DBMS = DLM REPLACE;
GETNAMES = NO;
DELIMITER = 'delimiter-character';
RUN;

NOTE:
----
Notice that GigDate is a readable date. This is because
IMPORT automatically assigns informats and formats to some forms of dates.


*/
