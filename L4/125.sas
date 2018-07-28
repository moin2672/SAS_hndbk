DATA marine;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Sealife.dat';
INPUT Name $ Family $ Length;
* Sort the data;
PROC SORT DATA = marine OUT = seasort NODUPKEY;
BY Family DESCENDING Length;
PROC PRINT DATA = seasort;
TITLE 'Whales and Sharks';
RUN;

/*
Sorting Your Data with PROC SORT

The variables named in the BY statement are called BY variables. You can specify as many BY
variables as you wish. With one BY variable, SAS sorts the data based on the values of that
variable.

With more than one variable, SAS sorts observations by the first variable, then by the
second variable within categories of the first, and so on.

A BY group is all the observations that
have the same values of BY variables. If, for example, your BY variable is State then all the
observations for North Dakota form one BY group

The DATA= and OUT= options specify the input and output data sets.

Example
This sample statement tells SAS to sort the data set named MESSY, and then put the sorted data into a data set named NEAT:
		PROC SORT DATA = messy OUT = neat;

The NODUPKEY option tells SAS to eliminate any duplicate observations that have the same values for the BY variables. To use this option, just add NODUPKEY to the PROC SORT statement:
		PROC SORT DATA = messy OUT = neat NODUPKEY;

Note:
By default SAS sorts data in ascending order, from lowest to highest or from A to Z

add the keyword DESCENDING to the BY statement "before each variable" that should be sorted from highest to lowest

Eg:
This statement tells SAS to sort
first by State (from A to Z) and 
then by City (from Z to A) within State:
	BY State DESCENDING City;


*/
