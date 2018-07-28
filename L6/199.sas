/*Combining Data Sets Using a One-to-Many Match Merge

Sometimes you need to combine two data sets by matching
one observation from one data set with more than one
observation in another. Suppose you had data for every
state in the U.S. and wanted to combine it with data for
every county. This would be a one-to-many match merge
because each state observation matches with many county
observations.

The statements for a one-to-many match merge are identical to the statements for a one-to-one
match merge:

						DATA new-data-set;
								MERGE data-set-1 data-set-2;
								BY variable-list;

The order of the data sets in the MERGE statement does not matter to SAS. In other words, a
one-to-many merge is the same as a many-to-one merge.

Before you merge two data sets, they must be sorted by one or more common variables. If your
data sets are not already sorted in the proper order, then use PROC SORT to do the job.


You cannot do a one-to-many merge without a BY statement. SAS uses the variables listed in the
BY statement to decide which observations belong together. Without any BY variables for
matching, SAS simply joins together the first observation from each data set, then the second
observation from each data set, and so on. In other words, SAS performs a one-to-one
unmatched merge, which is probably not what you want.

If you merge two data sets, and they have variables with the same namesbesides the BY
variablesthen variables from the second data set will overwrite any variables having the same
name in the first data set




*/


DATA regular;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\Shoe.dat';
INPUT Style $ 1-15 ExerciseType $ RegularPrice;
PROC SORT DATA = regular;
BY ExerciseType;
DATA discount;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\Disc.dat';
INPUT ExerciseType $ Adjustment;
* Perform many-to-one match merge;
DATA prices;
MERGE regular discount;
BY ExerciseType;
NewPrice = ROUND(RegularPrice - (RegularPrice * Adjustment), .01);
PROC PRINT DATA = prices;
TITLE 'Price List for May';
RUN;
