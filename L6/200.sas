/*Merging Summary Statistics with the Original Data

Once in a while you need to combine summary statistics
with your data, such as when you want to compare each
observation to the group mean, or when you want to
calculate a percentage using the group total.


To do this,
summarize your data using PROC MEANS, and put the
results in a new data set. Then merge the summarized data
back with the original data using a one-to-many match
merge.


*/


DATA shoes;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\Shoesales.dat';
INPUT Style $ 1-15 ExerciseType $ Sales;
PROC SORT DATA = shoes;
BY ExerciseType;
* Summarize sales by ExerciseType and print;
PROC MEANS NOPRINT DATA = shoes;
VAR Sales;
BY ExerciseType;
OUTPUT OUT = summarydata SUM(Sales) = Total;
PROC PRINT DATA = summarydata;
TITLE 'Summary Data Set';
* Merge totals with the original data set;
DATA shoesummary;
MERGE shoes summarydata;
BY ExerciseType;
Percent = Sales / Total * 100;
PROC PRINT DATA = shoesummary;
BY ExerciseType;
ID ExerciseType;
VAR Style Sales Total Percent;
TITLE 'Sales Share by Type of Exercise';
RUN;
