
* Using RETAIN and sum statements to find most runs and total runs;
DATA gamestats;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L2\Games.dat';
INPUT Month 1 Day 3-4 Team $ 6-25 Hits 27-28 Runs 30-31;
RETAIN MaxRuns;
MaxRuns = MAX(MaxRuns, Runs);
RunsToDate + Runs;
PROC PRINT DATA = gamestats;
TITLE "Season's Record to Date";
RUN;




/*
Using the RETAIN and Sum Statements

Use the RETAIN statement when you want SAS to preserve a variable’s
value from the previous iteration of the DATA step.

The RETAIN statement can appear anywhere
in the DATA step and has the following form, where all variables to be retained are listed after
the RETAIN keyword:
RETAIN variable-list;

		RETAIN variable-list initial-value;


*/
