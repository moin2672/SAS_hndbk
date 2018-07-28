DATA sales;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Flowers.dat';
INPUT CustomerID $ @9 SaleDate MMDDYY10. Petunia SnapDragon Marigold;
PROC SORT DATA = sales;
BY CustomerID;
* Calculate means by CustomerID, output sum and mean to new data set;
PROC MEANS NOPRINT DATA = sales;
	BY CustomerID;
	VAR Petunia SnapDragon Marigold;
	OUTPUT OUT = totals MEAN(Petunia SnapDragon Marigold) =	MeanPetunia MeanSnapDragon MeanMarigold
						SUM(Petunia SnapDragon Marigold) = Petunia SnapDragon Marigold;
PROC PRINT DATA = totals;
TITLE 'Sum of Flower Data over Customer ID';
FORMAT MeanPetunia MeanSnapDragon MeanMarigold 3.;
RUN;

/*
Writing Summary Statistics to a SAS Data Set

For example, you might want to
plot the hourly temperature in your office to show how it heats up every
afternoon causing you to fall asleep, but the instrument you have records
data for every minute.

The MEANS procedure can condense the data by
computing the mean temperature for each hour and then save the results in a
SAS data set so it can be plotted.


There are two methods in PROC MEANS for saving summary statistics in a SAS data set

1. Output Delivery System (ODS), <covered in section 5.3>
2. OUTPUT statement.

			OUTPUT OUT = data-set output-statistic-list;

The following is one of the possible forms for output-statistic-list:
statistic(variable-list) = name-list

* statistic can be any of the statistics available in PROC MEANS (SUM, N, MEAN, for example),
* variable-list defines which of the variables in the VAR statement you want to output, and 
* name-list defines the new variable names for the statistics.

The new variable names must be in the same order as their corresponding variables in variable-list.

PROC MEANS statements produce a new data set called ZOOSUM, which contains one
observation with the variables LionWeight, the mean of the lions’ weights, and BearWeight,
the mean of the bears’ weights:


	PROC MEANS DATA = zoo NOPRINT;
		VAR Lions Tigers Bears;
		OUTPUT OUT = zoosum MEAN(Lions Bears) = LionWeight BearWeight;
	RUN;

The NOPRINT option in the PROC MEANS statement tells SAS there is no need to produce any
printed results since we are saving the results in a SAS data set

The SAS data set created in the OUTPUT statement will contain all the variables defined in the
output statistic list;

any variables listed in a BY or CLASS statement; plus two new variables,
_TYPE_ and _FREQ_.

If there is no BY or CLASS statement, then the data set will have just one
observation

If there is a BY statement, then the data set will have one observation for each level
of the BY group.

CLASS statements produce one observation for each level of interaction of the
class variables.

The value of the _TYPE_ variable depends on the level of interaction. The
observation where _TYPE_ has a value of zero is the grand total.

Note:
Using PROC MEANS with a NOPRINT option is the same as using PROC SUMMARY.
For a more detailed explanation of the _TYPE_ variable, see the SAS Help and Documentation


*/
