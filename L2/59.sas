* Create a SAS data set named toads;
* Read the data file ToadJump.dat using list input;
DATA toads;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\ToadJump.dat';
INPUT ToadName $ Weight Jump1 Jump2 Jump3;
* Print the data to make sure the file was read correctly;
PROC PRINT DATA = toads;
TITLE 'SAS Data Set Toads';
RUN;
