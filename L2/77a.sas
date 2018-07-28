DATA class102;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Scores.dat' MISSOVER;
INPUT Name $ Test1 Test2 Test3 Test4 Test5;
proc print data=class102;
RUN;

/*
check the command without MISSOVER and find the difference


MISSOVER By default, SAS will go to the next data line to read more data if SAS has reached
the end of the data line and there are still more variables in the INPUT statement that have not
been assigned values. The MISSOVER option tells SAS that if it runs out of data, don’t go to the
next data line. Instead, assign missing values to any remaining variables




*/
