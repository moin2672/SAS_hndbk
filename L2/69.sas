DATA weblogs;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\dogweblogs.txt';
INPUT @'[' AccessDate DATE11. @'GET' File :$20.;
PROC PRINT DATA = weblogs;
TITLE 'Dog Care Web Logs';
RUN;

/*
This INPUT statement uses @‘[‘ to position the column pointer to read the date, then uses @‘GET’
to position the column pointer to read the filename. Because the filename is more than 8
characters, but not always the same number of characters, an informat with a colon modifier :$20. is
used to read the filename.
*/
