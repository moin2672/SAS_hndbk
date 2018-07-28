/*Stacking Data Sets Using the SET Statement

The SET statement with one SAS data set allows you to read and modify the
data.

With two or more data sets, in addition to reading and modifying the
data, the SET statement concatenates or stacks the data sets one on top of the
other.

This is useful when you want to combine data sets with all or most of
the same variables but different observations


In a DATA step, first specify the name of the new SAS data set in the DATA
statement, then list the names of the old data sets you want to combine in the
SET statement:

						DATA new-data-set;
							SET data-set-1 data-set-n;

The number of observations in the new data set will equal the sum of the number of observations
in the old data sets. The order of observations is determined by the order of the list of old data
sets. If one of the data sets has a variable not contained in the other data sets, then the observations
from the other data sets will have missing values for that variable.



*/

DATA southentrance;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\South.dat';
INPUT Entrance $ PassNumber PartySize Age;
PROC PRINT DATA = southentrance;
TITLE 'South Entrance Data';
DATA northentrance;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\North.dat';
INPUT Entrance $ PassNumber PartySize Age Lot;
PROC PRINT DATA = northentrance;
TITLE 'North Entrance Data';

* Create a data set, both, combining northentrance and southentrance;
* Create a variable, AmountPaid, based on value of variable Age;
DATA both;
SET southentrance northentrance;
IF Age = . THEN AmountPaid = .;
ELSE IF Age < 3 THEN AmountPaid = 0;
ELSE IF Age < 65 THEN AmountPaid = 35;
ELSE AmountPaid = 27;
PROC PRINT DATA = both;
TITLE 'Both Entrances';
RUN;
