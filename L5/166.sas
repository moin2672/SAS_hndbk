DATA giant;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L5\Tomatoes.dat' DSD;
INPUT Name :$15. Color $ Days Weight;

* Trace PROC MEANS;

ODS TRACE ON;
PROC MEANS DATA = giant;
BY Color;
RUN;
ODS TRACE OFF;
