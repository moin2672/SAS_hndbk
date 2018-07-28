DATA sales;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Onions.dat';
INPUT VisitingTeam $ 1-20 ConcessionSales 21-24 BleacherSales 25-28
OurHits 29-31 TheirHits 32-34 OurRuns 35-37 TheirRuns 38-40;
* Print the data to make sure the file was read correctly;
PROC PRINT DATA = sales;
TITLE 'SAS Data Set Sales';
RUN;
