

* Read data from external file into SAS data set;
/*Long records In some operating environments, SAS assumes external files have a record length
of 256 or less. (The record length is the number of characters, including spaces, in a data line.) If
your data lines are long, and it looks like SAS is not reading all your data, then use the LRECL=
option in the INFILE statement to specify a record length at least as long as the longest record in
your data file.*/
DATA uspresidents;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\President.dat' LRECL=2000;
INPUT President $ Party $ Number;
RUN;
