/*The ODS SELECT statement
ODS SELECT (or EXCLUDE) statement to choose just the output objects you want

The PROC step with the output objects you want to select
ODS SELECT output-object-list;
RUN;


*/

PROC MEANS DATA = giant;
BY Color;
TITLE 'Red Tomatoes';
ODS SELECT Means.ByGroup1.Summary;
RUN;
