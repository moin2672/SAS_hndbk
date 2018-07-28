/*Customizing PROC REPORT Output with the STYLE= Option

			PROC REPORT STYLE(location-list) = {style-attribute = value};

HEADER ---> column headings
COLUMN  ---> data cells
SUMMARY --->  totals created by SUMMARIZE option in BREAK or RBREAK statements

Eg:
DEFINE Month / GROUP STYLE(HEADER COLUMN) = {BACKGROUND = blue};
BREAK AFTER Month / SUMMARIZE STYLE(SUMMARY) = {BACKGROUND = red};
RBREAK AFTER / SUMMARIZE STYLE(SUMMARY) = {BACKGROUND = orange};



*/


DATA skating;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L5\speed.dat' DSD;
INPUT Name :$20. Country $
Year NumGold @@;
ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\speed.htm';
PROC REPORT DATA = skating NOWINDOWS;
COLUMN Name Country NumGold, SUM;
DEFINE Name / GROUP;
DEFINE Country / GROUP;
TITLE 'Olympic Women''s '
'Speed Skating';
RUN;
ODS HTML CLOSE;


* STYLE= option in PROC statement;
ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\speed2.htm';
PROC REPORT DATA = skating NOWINDOWS
STYLE(COLUMN) =
{BACKGROUND = white JUST = center};
COLUMN Name Country NumGold, SUM;
DEFINE Name / GROUP;
DEFINE Country / GROUP;
TITLE 'Olympic Women''s '
'Speed Skating';
RUN;
ODS HTML CLOSE;


* STYLE= option in DEFINE statement;
ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\speed3.htm';
PROC REPORT DATA = skating NOWINDOWS;
COLUMN Name Country NumGold, SUM;
DEFINE Name / GROUP
STYLE(COLUMN) =
{BACKGROUND = white JUST = center};
DEFINE Country / GROUP;
TITLE 'Olympic Women''s '
'Speed Skating';
RUN;
ODS HTML CLOSE;
