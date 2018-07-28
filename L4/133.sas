DATA carsurvey;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Cars.dat';
INPUT Age Sex Income Color $;
PROC FORMAT;
	VALUE gender 	1 = 'Male'
					2 = 'Female'
					;
	VALUE agegroup 	13 -< 20 = 'Teen'
					20 -< 65 = 'Adult'
					65 - HIGH = 'Senior'
					;
	VALUE $col 		'W' = 'Moon White'
					'B' = 'Sky Blue'
					'Y' = 'Sunburst Yellow'
					'G' = 'Rain Cloud Gray'
					;/*since coded value is a char the format name is intialized with $*/
* Print data using user-defined and standard (DOLLAR8.) formats;
PROC PRINT DATA = carsurvey;
FORMAT Sex gender. Age agegroup. Color $col. Income DOLLAR8.;
TITLE 'Survey Results Printed with User-Defined Formats';
RUN;

/*
Creating Your Own Formats Using PROC FORMAT

PROC FORMAT;
	VALUE name 	range-1 = 'formatted-text-1'
				range-2 = 'formatted-text-2'
				.
				.
				.
				range-n = 'formatted-text-n';

*Notice that the format names do not end with periods in the VALUE statement, but they do in the FORMAT statement.

*/
