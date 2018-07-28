DATA homeaddress;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Address.dat' TRUNCOVER;
INPUT Name $ 1-15 Number 16-19 Street $ 22-37;
PROC PRINT DATA=homeaddress;
RUN;

/*
check the command without TRUNCOVER and find the difference
TRUNCOVER
---------
TRUNCOVER You need the TRUNCOVER option when you are reading data using column
or formatted input and some data lines are shorter than others. If a variable's field extends past the
end of the data line, then, by default, SAS will go to the next line to start reading the variable's
value. This option tells SAS to read data for the variable until it reaches the end of the data line,
or the last column specified in the format or column range, whichever comes first. The next file
contains addresses and must be read using column or formatted input because the street names
have embedded blanks. Note that the data lines are all different lengths:

NOTE
----
TRUNCOVER is similar to MISSOVER. Both will assign missing values to variables if the data
line ends before the variable’s field starts. But when the data line ends in the middle of a variable
field, TRUNCOVER will take as much as is there, whereas MISSOVER will assign the variable a
missing value.

*/
