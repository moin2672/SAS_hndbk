* Create a SAS data set named highlow;
* Read the data file using line pointers;
DATA highlow;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Temperature.dat';
INPUT City $ State $
/ NormalHigh NormalLow
#3 RecordHigh RecordLow;
PROC PRINT DATA = highlow;
TITLE 'High and Low Temperatures for July';
RUN;
/*
The line pointers, slash (/) and pound-n (#n), are like road signs telling SAS, "Go this way."

To read more than one line of raw data for a single observation, you simply insert a slash into
your INPUT statement when you want to skip to the next line of raw data

The #n line pointer
performs the same action except that you specify the line number. The n in #n stands for the
number of the line of raw data for that observation; so #2 means to go to the second line for that
observation, and #4 means go to the fourth line.

*/
