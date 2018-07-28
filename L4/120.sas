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
TITLE 'Title default'; /*title default is not getting displayed*/
TITLE1 'Title 1';
TITLE2 'Title 2';
TITLE3 'Title 3';
TITLE4 'Title 4';
TITLE5 'Title 5';
TITLE6 'Title 6';
TITLE7 'Title 7';
TITLE8 'Title 8';
TITLE9 'Title 9';
FOOTNOTE 'Foot Note Default';
FOOTNOTE1 ' FOOTNOTE1 '; 
FOOTNOTE2 ' FOOTNOTE2 ' ;
FOOTNOTE3 ' FOOTNOTE3 ' ;
FOOTNOTE4 ' FOOTNOTE4 ' ;
FOOTNOTE5 ' FOOTNOTE5 ' ;
FOOTNOTE6 ' FOOTNOTE6 ' ;
FOOTNOTE7 ' FOOTNOTE7 ' ;
FOOTNOTE8 ' FOOTNOTE8 ' ;
FOOTNOTE9 ' FOOTNOTE9 ' ;

RUN;
/*
Using Shortcuts for Lists of Variable Names


Note that both ARRAY statements use abbreviated variable lists; 
array NEW uses a numbered range list and 
array OLD uses a name range list.


*/
