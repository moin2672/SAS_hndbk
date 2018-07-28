/*Customizing PROC TABULATE Output with the STYLE=Option

PROC TABULATE --> all the data cells
CLASS  --> class variable name headings
CLASSLEV --> class level value headings
TABLE --> (crossed with elements)1 element’s data cell
VAR --> analysis variable name headings

PROC TABULATE statement
				PROC TABULATE DATA = mysales STYLE = {BACKGROUND = yellow};

TABLE statement
				TABLE City, Month ALL*{STYLE = {BACKGROUND = red}};

CLASSLEV, VAR, and CLASS statements
				CLASSLEV Month / STYLE = {FOREGROUND = green};




*/


ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\table.htm';
DATA skating;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L5\records.dat';
INPUT Year Event $ Record $ @@;
PROC TABULATE DATA=skating;
CLASS Year Record;
TABLE Year='',Record*N='';
TITLE 'Men''s Speed Skating';
TITLE2 'Records Set at Olympics';
RUN;
ODS HTML CLOSE;


ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\table2.htm';
PROC TABULATE DATA=skating
STYLE={JUST=center BACKGROUND=white};
CLASS Year Record;
TABLE Year='',Record*N='';
TITLE 'Men''s Speed Skating';
TITLE2 'Records Set at Olympics';
RUN;
ODS HTML CLOSE;

