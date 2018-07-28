DATA songs;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L2\WBRK.dat';
INPUT City $ 1-15 Age domk wj hwow simbh kt aomm libm tr filp ttr;
ARRAY new (10) Song1 - Song10;
ARRAY old (10) domk -- ttr;
DO i = 1 TO 10;
IF old(i) = 9 THEN new(i) = .;
ELSE new(i) = old(i);
END;
AvgScore = MEAN(OF Song1 - Song10);
PROC PRINT DATA = songs;
TITLE 'WBRK Song Survey';
RUN;
/*
Using Shortcuts for Lists of Variable Names


Note that both ARRAY statements use abbreviated variable lists; 
array NEW uses a numbered range list and 
array OLD uses a name range list.


*/
