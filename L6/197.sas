/*Combining Data Sets Using a One-to-One Match Merge

When you want to match observations from one data set
with observations from another, use the MERGE statement
in the DATA step


If you know the two data sets are in
EXACTLY the same order, you don’t have to have any
common variables between the data sets. Typically,
however, you will want to have, for matching purposes, a
common variable or several variables which taken together uniquely identify each observation.


This is important. Having a common variable to merge by ensures that the observations are
properly matched.

Merging SAS data sets is a simple process

First, if the data are not already sorted, use the SORT
procedure to sort all data sets by the common variables

Then, in the DATA statement, name the
new SAS data set to hold the results and follow with a MERGE statement listing the data sets to
be combined. Use a BY statement to indicate the common variables:


						DATA new-data-set;
								MERGE data-set-1 data-set-2;
								BY variable-list;

If you merge two data sets, and they have variables with the same names—besides the BY
variables—then variables from the second data set will overwrite any variables having the
same name in the first data set

*/

DATA descriptions;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\chocolate.dat' TRUNCOVER;
INPUT CodeNum $ 1-4 Name $ 6-14 Description $ 15-60;
PROC PRINT DATA=descriptions;
DATA sales;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\chocsales.dat';
INPUT CodeNum $ 1-4 PiecesSold 6-7;
PROC PRINT DATA=sales;
PROC SORT DATA = sales;
BY CodeNum;
* Merge data sets by CodeNum;
DATA chocolates;
MERGE sales descriptions;
BY CodeNum;
PROC PRINT DATA = chocolates;
TITLE "Today's Chocolate Sales";
RUN;
