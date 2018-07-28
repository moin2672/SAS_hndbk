DATA funnies;
INPUT Id Name $ Height Weight DoB MMDDYY8.;
LABEL Id = 'Identification no.'
Height = 'Height in inches'
Weight = 'Weight in pounds'
DoB = 'Date of birth';
INFORMAT DoB MMDDYY8.;
FORMAT DoB WORDDATE18.;
DATALINES;
53 Susie 42 41 07-11-81
54 Charlie 46 55 10-26-54
55 Calvin 40 35 01-10-81
56 Lucy 46 52 01-13-55
;
* Use PROC CONTENTS to describe data set funnies;
/*PROC CONTENTS DATA = funnies;*/
PROC PRINT DATA=funnies noobs label;
RUN;

/*
PROC CONTENTS is a simple procedure
	PROC CONTENTS DATA = data-set;
If you omit the DATA= option, then by default SAS will use the most recently created data set.

Note that the DATA step above includes a LABEL statement. For each variable, you can specify a
label up to 256 characters long. These optional labels allow you to document your variables in
more detail than is possible with just variable names.

You can also use LABEL statements in PROC steps to customize your reports, but
then the labels apply only for the duration of the PROC step and 
are not stored in the data set.

INFORMAT and FORMAT statements also appear in this program

*/
