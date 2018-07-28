
DATA boats;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Boats1.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-36 Length 38-40;
* Using the FORMAT= option in the TABLE statement;
/*PROC PRINT DATA= boats;*/
/*run;*/

PROC TABULATE DATA = boats;
CLASS Locomotion Type;
VAR Price Length;
TABLE Locomotion ALL,
MEAN * (Price*FORMAT=DOLLAR6.2 Length*FORMAT=6.0) * (Type ALL);
TITLE 'Price and Length by Type of Boat';
RUN;

/*
Specifying Multiple Formats for Data Cells in PROC
TABULATE Output

Using the FORMAT= option in a PROC TABULATE statement, you can easily specify a format
for the data cells; but you can only specify one format, and it must apply to all the data cells. If
you want to use more than one format in your table, you can do that by putting the FORMAT=
option in your TABLE statement.

variable-name*FORMAT=formatw.d

For Example,
		TABLE Region, MEAN*(Sales*FORMAT=COMMA8.0 Profit*FORMAT=DOLLAR10.2);



*/
