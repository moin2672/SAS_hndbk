DATA boats;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Boats.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-36;
* PROC TABULATE report with options;
PROC TABULATE DATA = boats FORMAT=DOLLAR9.2;
CLASS Locomotion Type;
VAR Price;
TABLE Locomotion ALL, MEAN*Price*(Type ALL) /BOX='Full Day Excursions' MISSTEXT='none';
TITLE;  /*null title*/
RUN;

/*
Enhancing the Appearance of PROC TABULATE Output

PROC TABULATE, SAS wraps your data in tidy little boxes, but there may be
times when they just don’t look right.


Using three simple options, you can enhance the
appearance of your output. Think of it as changing the wrapping paper.
		1. FORMAT= option
		2. BOX= option
		3. MISSTEXT= options

FORMAT= option
--------------
To change the format of all the data cells in your table, use the
FORMAT= option in your PROC statement

For example,
			PROC TABULATE FORMAT=COMMA10.0;


BOX= and MISSTEXT= options
--------------------------
the BOX= and MISSTEXT= options go in TABLE statements

The BOX= option
---------------
allows you to write a brief phrase in the normally empty box that appears in the upper left
corner of every TABULATE report.
Using this empty space can give your reports a nicely
polished look.

The MISSTEXT= option, 
--------------------
on the other hand, specifies a value for SAS to print in
empty data cells.
You can give
them something more meaningful with the MISSTEXT= option.

For example,
			TABLE Region, MEAN*Sales / BOX='Mean Sales by Region' MISSTEXT='No Sales';

* BOX= option serves as a title, a null TITLE statement is used to remove the usual
title.

*/
