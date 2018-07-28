/*Interleaving Data Sets Using the SET Statement

The previous section explained how to stack data sets that have all or most of
the same variables but different observations


However, if you have data sets
that are already sorted by some important variable, then simply stacking the
data sets may unsort the data sets.

You could stack the two data sets and then
re-sort them using PROC SORT. But if your data sets are already sorted, it is
more efficient to preserve that order, than to stack and re-sort.

All you need to
do is use a BY statement with your SET statement. Here’s the general form:

					DATA new-data-set;
						SET data-set-1 data-set-n;
						BY variable-list;

In a DATA statement, you specify the name of the new SAS data set you want to create. In a SET
statement, you list the data sets to be interleaved. Then in a BY statement, you list one or more
variables that SAS should use for ordering the observations

The number of observations in the
new data set will be equal to the sum of the number of observations in the old data sets. 

If one of
the data sets has a variable not contained in the other data sets, then values of that variable will
be set to missing for observations from the other data sets.

Before you can interleave observations, the data sets must be sorted by the BY variables. If one or
the other of your data sets is not already sorted, then use PROC SORT to do the job.



*/

DATA southentrance;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\South.dat';
INPUT Entrance $ PassNumber PartySize Age;
PROC PRINT DATA = southentrance;
TITLE 'South Entrance Data';
DATA northentrance;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\North.dat';
INPUT Entrance $ PassNumber PartySize Age Lot;
PROC SORT DATA = northentrance;
BY PassNumber;
PROC PRINT DATA = northentrance;
TITLE 'North Entrance Data';
* Interleave observations by PassNumber;
DATA interleave;
SET northentrance southentrance;
BY PassNumber;
PROC PRINT DATA = interleave;
TITLE 'Both Entrances, By Pass Number';
RUN;
