DATA boats;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Boats.dat';
INPUT Name $ 1-12 Port $ 14-20 Locomotion $ 22-26 Type $ 28-30
Price 32-36;
* Changing headers;
PROC FORMAT;
VALUE $typ 'cat' = 'catamaran'
'sch' = 'schooner'
'yac' = 'yacht';
/*actual program */
PROC TABULATE DATA = boats FORMAT=DOLLAR9.2;
CLASS Locomotion Type;
VAR Price;
FORMAT Type $typ.;
TABLE Locomotion='' ALL,
MEAN=''*Price='Mean Price by Type of Boat'*(Type='' ALL)
/BOX='Full Day Excursions' MISSTEXT='none';
TITLE;
RUN;

/*
* with row float
PROC TABULATE DATA = boats FORMAT=DOLLAR9.2;
CLASS Locomotion Type;
VAR Price;
FORMAT Type $typ.;
TABLE MEAN=''*Price='Mean Price by Type of Boat'*(Type='' ALL),Locomotion='' ALL 
/BOX='Full Day Excursions' MISSTEXT='none' ROW=FLOAT;
TITLE;
RUN;
*/
/*
* without row float
PROC TABULATE DATA = boats FORMAT=DOLLAR9.2;
CLASS Locomotion Type;
VAR Price;
FORMAT Type $typ.;
TABLE MEAN=''*Price='Mean Price by Type of Boat'*(Type='' ALL),Locomotion='' ALL 
/BOX='Full Day Excursions' MISSTEXT='none' ROW=FLOAT;
TITLE;
RUN;
*/

/*
about program
-------------
This program does not require the ROW=FLOAT option because the only variable being set to
blank in the row dimension is a class variable. If you put an analysis variable or statistics keyword
in the row dimension and set it equal to blank, then you would need to add the ROW=FLOAT
option to remove empty boxes.

*/

/*
Changing Headers in PROC TABULATE Output

The TABULATE procedure produces reports with a lot of headers. Sometimes there are so many
headers that your reports look cluttered;

at other times you may simply feel that a different
header would be more meaningful.

TABULATE reports have two basic types of headers:
1. headers that are the values of variables listed in a CLASS statement,
2. headers that are the names of variables and keywords.

You use different methods to change different types of
headers

CLASS variable values
---------------------
To change headers which are the values of variables listed in a
CLASS statement, use the FORMAT procedure to create a user-defined format
Then assign the format to the variable in a FORMAT statement (section 4.7).

Variable names and keywords
---------------------------
To change headers which are the names of variables or
keywords, put an equal sign after the variable or keyword followed by the new header enclosed
in quotation marks.

You can eliminate a header entirely by setting it equal to blank (two
quotation marks with nothing in between), and SAS will remove the box for that header.

For example,
			TABLE Region='', MEAN=''*Sales='Mean Sales by Region';

tells SAS to remove the headers for Region, and MEAN, and to change the header for the
variable Sales to “Mean Sales by Region.”

In some cases SAS leaves the empty box when a row header is set to blank

This happens for
statistics and analysis variables (but not class variables). To force SAS to remove the empty box,
add the ROW=FLOAT option to the end of your TABLE statement like this:

							TABLE MEAN=''*Sales='Mean Sales by Region', Region='' / ROW=FLOAT;





*/
