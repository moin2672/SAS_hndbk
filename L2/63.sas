/*
Use informats by placing the informat after the variable name in the INPUT statement; this is
called formatted input. The following INPUT statement is an example of formatted input:
INPUT Name $10. Age 3. Height 5.1 BirthDate MMDDYY10.;
*/

* Create a SAS data set named contest;
* Read the file Pumpkin.dat using formatted input;
DATA contest;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Pumpkin.dat';
INPUT Name $16. Age 3. +1 Type $1. +1 Date MMDDYY10. /*The +1 skips over one column*/
(Score1 Score2 Score3 Score4 Score5) (4.1); /*The remaining variables, Score1 through Score5, all require the same informat, 4.1.
By putting the variables and the informat in separate sets of parentheses, you only have to list the
informat once*/
* Print the data set to make sure the file was read correctly;
PROC PRINT DATA = contest;
TITLE 'Pumpkin Carving Contest';
RUN;
