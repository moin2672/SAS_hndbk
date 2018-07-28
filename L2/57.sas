

* Read data from external file into SAS data set;
DATA uspresidents;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\President.dat';
INPUT President $ Party $ Number;
RUN;
