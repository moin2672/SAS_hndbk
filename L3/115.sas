* Change all 9s to missing values;
DATA songs;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L2\WBRK.dat';
INPUT City $ 1-15 Age domk wj hwow simbh kt aomm libm tr filp ttr;
ARRAY song (10) domk wj hwow simbh kt aomm libm tr filp ttr;
/*An array, SONG, is defined as having ten variables, the same ten variables that appear in the
INPUT statement representing the ten songs*/
DO i = 1 TO 10;
IF song(i) = 9 THEN song(i) = .;
END;

/*All statements
between the DO statement and the END statement are executed, in this case, ten times, once for
each variable in the array.
*/

PROC PRINT DATA = songs;
TITLE 'WBRK Song Survey';
RUN;

/*
Simplifying Programs with Arrays


*/
