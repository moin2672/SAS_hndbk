* Choose only comedies;
DATA comedy;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L2\Shakespeare.dat';
INPUT Title $ 1-26 Year Type $;
IF Type = 'comedy';
PROC PRINT DATA = comedy;
TITLE 'Shakespearean Comedies';
RUN;

/*
Generally, you use the subsetting IF when it is easier
to specify a condition for including observations, and use the DELETE statement when is easier to
specify a condition for excluding observations.

*/
