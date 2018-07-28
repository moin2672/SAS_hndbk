DATA icecream;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Sales.dat' FIRSTOBS = 3;
INPUT Flavor $ 1-9 Location BoxesSold;
proc print data=icecream;
RUN;
