* Input more than one observation from each record;
DATA rainfall;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Precipitation.dat';
INPUT City $ State $ NormalRain MeanDaysRain @@;
PROC PRINT DATA = rainfall;
TITLE 'Normal Total Precipitation and';
TITLE2 'Mean Days with Precipitation for July';
RUN;

/*
Reading Multiple Observations per Line of Raw Data
--------------------------------------------------
When you have multiple observations per line of raw
data, you can use double trailing at signs (@@) at the end of your INPUT statement. This linehold
specifier is like a stop sign telling SAS, "Stop, hold that line of raw data." SAS will hold that
line of data, continuing to read observations until it either runs out of data or reaches an INPUT
statement that does not end with a double trailing @.

*/
