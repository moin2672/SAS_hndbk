/*Customizing PROC PRINT Output with the STYLE= Option


			PROC PRINT STYLE(location-list) = {style-attribute = value};


DATA ---- > all the data cells
HEADER---- > the column headers (variable names)
OBS---- > the data in the OBS column or ID column if using an ID statement
OBSHEADER---- > the header for the OBS or ID column
TOTAL---- > the data in the totals row produced by a SUM statement
GRANDTOTAL ---- >the data for the grand total produced by a SUM statement

			VAR variable-list / STYLE(location-list) = {style-attribute = value};





*/


ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\results.htm';
DATA skating;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L5\women.csv' DSD MISSOVER;
INPUT Year Name :$20. Country $
Time $ Record $;
PROC PRINT DATA=skating;
TITLE 'Women''s 5000 Meter Speed Skating';
ID Year;
RUN;
ODS HTML CLOSE;


ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\results2.htm';
PROC PRINT DATA=skating
STYLE(DATA)={BACKGROUND=white};
TITLE 'Women''s 5000 Meter Speed Skating';
ID Year;
RUN;
ODS HTML CLOSE;


ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\results3.htm';
PROC PRINT DATA=skating
STYLE(DATA)={BACKGROUND=white};
TITLE 'Women''s 5000 Meter Speed Skating';
VAR Name Country Time;
VAR Record/STYLE(DATA)=
{FONT_STYLE=italic FONT_WEIGHT=bold};
ID Year;
RUN;
ODS HTML CLOSE;
