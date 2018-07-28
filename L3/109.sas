
DATA librarycards;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L2\Dates.dat' TRUNCOVER;
INPUT Name $11. +1 BirthDate DATE9. +1 IssueDate MMDDYY10.;
ExpireDate = IssueDate + (365.25 * 3);
ExpireQuarter = QTR(ExpireDate);   /*representing interms of Quaters*/
IF IssueDate > '01JAN2003'D THEN NewCard = 'yes';
PROC PRINT DATA = librarycards;
FORMAT IssueDate MMDDYY8. ExpireDate WEEKDATE17.;
TITLE 'SAS Dates without and with Formats';
RUN;




/*
Working with SAS Dates

Selected Date Informats, Functions, and Formats
pg:110
Examples-pgno: 111

*/
