/*Combining a Grand Total with the Original Data

You can use the MEANS procedure to create a data set
containing a grand total rather than BY group totals.

But
you cannot use a MERGE statement to combine a grand
total with the original data because there is no common
variable to merge by. Luckily, there is another way. You
can use two SET statements like this:

			DATA new-data-set;
					IF _N_ = 1 THEN SET summary-data-set;
					SET original-data-set;

In this DATA step, original-data-set is the data set with more than one observation (the original
data) and summary-data-set is the data set with a single observation (the grand total).

SAS reads
original-data-set in a normal SET statement, simply reading the observations in a straightforward
way.

SAS also reads summary-data-set with a SET statement but only in the first iteration of the
DATA step (when _N_ equals 1)

SAS then retains the values of variables from summary-data-set
for all observations in new-data-set.


This works because variables read with a SET statement are automatically retained.

Normally
you don’t notice this because the retained values are overwritten by the next observation. But in
this case the variables from summary-data-set are read once at the first iteration of the DATA step
and then retained for all other observations.

The effect is similar to a RETAIN statement
(discussed in section 3.9). This technique can be used any time you want to combine a single
observation with many observations, without a common variable


*/

DATA shoes;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\Shoesales.dat';
INPUT Style $ 1-15 ExerciseType $ Sales;
* Output grand total of sales to a data set and print;
PROC MEANS NOPRINT DATA = shoes;
VAR Sales;
OUTPUT OUT = summarydata SUM(Sales) = GrandTotal;
PROC PRINT DATA = summarydata;
TITLE 'Summary Data Set';
* Combine the grand total with the original data;
DATA shoesummary;
IF _N_ = 1 THEN SET summarydata;
SET shoes;
Percent = Sales / GrandTotal * 100;
PROC PRINT DATA = shoesummary;
VAR Style ExerciseType Sales GrandTotal Percent;
TITLE 'Overall Sales Share';
RUN;
