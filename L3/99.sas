DATA contest;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L2\Pumpkin.dat';
INPUT Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10.
(Scr1 Scr2 Scr3 Scr4 Scr5) (4.1);   						/*note the list of variable declaration of same type*/
AvgScore = MEAN(Scr1, Scr2, Scr3, Scr4, Scr5);				/*AvgScore is created using the MEAN function*/
DayEntered = DAY(Date);
Type = UPCASE(Type);										/*for uppercase UPCASE & for lowercase LOWCASE*/
PROC PRINT DATA = contest;
TITLE 'Pumpkin Carving Contest';
RUN;

/*
Selected SAS Functions
pgNo: 100
*/
