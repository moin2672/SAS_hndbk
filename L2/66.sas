* Create a SAS data set named nationalparks;
* Read a data file Park.dat mixing input styles;
DATA nationalparks;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Park.dat';
INPUT ParkName $ 1-22 State $ Year @40 Acreage COMMA9.; 
PROC PRINT DATA = nationalparks;
TITLE 'Selected National Parks';
RUN;

/*Sometimes you need to move the pointer explicitly, and you can do that by using the column
pointer, @n, where n is the number of the column SAS should move to.*/

/*In the preceding program, the column pointer @40 tells SAS to move to column 40 before reading
the value for Acreage.*/

/* The column pointer, @n, has other uses too and can be used anytime you want SAS to skip
backwards or forwards within a data line. You could use it, for example, to skip over unneeded
data, or to read a variable twice using different informats.
*/
