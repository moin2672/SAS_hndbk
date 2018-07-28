

* Use a trailing @, then delete surface streets;
DATA freeways;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Traffic.dat';
INPUT Type $ @;
IF Type = 'surface' THEN DELETE;
INPUT Name $ 9-38 AMTraffic PMTraffic;
PROC PRINT DATA = freeways;
TITLE 'Traffic for Freeways';
RUN;

/*
Instead, you can read just enough variables to decide whether to keep the current observation,
then end the INPUT statement with an at sign (@), called a trailing at. This tells SAS to hold that
line of raw data. While the trailing @ holds that line, you can test the observation with an IF
statement to see if it's one you want to keep. If it is, then you can read data for the remaining
variables with a second INPUT statement. Without the trailing @, SAS would automatically start
reading the next line of raw data with each INPUT statement.

The trailing @ is similar to the column pointer, @n, introduced in section 2.9. By specifying a
number after the @ sign, you tell SAS to move to a particular column. By using an
@ without specifying a column, it is as if you are telling SAS, “Stay tuned for more information.
Don't touch that dial!” SAS will hold that line of data until it reaches either the end of the DATA
step, or an INPUT statement that does not end with a trailing @.

NOTE
----
Trailing @ versus double trailing @ The double trailing @, discussed in the previous
section, is similar to the trailing @. Both are line-hold specifiers; the difference is how long they
hold a line of data for input. The trailing @ holds a line of data for subsequent INPUT statements,
but releases that line of data when SAS returns to the top of the DATA step to begin building the
next observation. The double trailing @ holds a line of data for subsequent INPUT statements even
when SAS starts building a new observation. In both cases, the line of data is released if SAS
reaches a subsequent INPUT statement that does not contain a line-hold specifier.

*/
