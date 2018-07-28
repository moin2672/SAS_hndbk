DATA icecream;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Sales.dat' FIRSTOBS = 3 OBS=5;
INPUT Flavor $ 1-9 Location BoxesSold;
proc print data=icecream;
RUN;
/*
FIRSTOBS= The FIRSTOBS= option tells SAS at what line to begin reading data. This
is useful if you have a data file that contains descriptive text or header information at the
beginning, and you want to skip over these lines to begin reading the data

OBS= 
----
The OBS= option can be used anytime you want to read only a part of your data file.
It tells SAS to stop reading when it gets to that line in the raw data file. Note that it does not
necessarily correspond to the number of observations. 

If, for example, you are reading two raw
data lines for each observation, then an OBS=100 would read 100 data lines, and the resulting
SAS data set would have 50 observations. The OBS= option can be used with the FIRSTOBS=
option to read lines from the middle of the file

*/
