/*Adding Traffic-Lighting to Your Output

Traffic-lighting can be used in any of
the three reporting procedures: PRINT, REPORT, and TABULATE.

PROC FORMAT;
VALUE posneg
LOW -< 0 = ‘red’
0-HIGH = ‘black’;



*/

ODS HTML FILE='C:\Users\448513\Documents\My SAS Files\9.1\L5\mens.html';
DATA results;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L5\mens5000.dat' DSD;
INPUT Place Name :$20.
Country :$15. Time ;
PROC PRINT DATA=results;
ID Place;
TITLE 'Men''s 5000m Speed Skating';
TITLE2 '2002 Olympic Results';
RUN;
ODS HTML CLOSE;
