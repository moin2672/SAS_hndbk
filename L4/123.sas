DATA 'C:\Users\448513\Documents\My SAS Files\9.1\L3';
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Artists.dat';
INPUT Name $ 1-21 Genre $ 23-40 Origin $ 42;

PROC PRINT DATA = 'C:\Users\448513\Documents\My SAS Files\9.1\L3';
WHERE Genre = 'Impressionism';
TITLE 'Major Impressionist Painters';
FOOTNOTE 'F = France N = Netherlands U = US';
RUN;

/*
Subsetting in Procedures with the WHERE Statement


*/
