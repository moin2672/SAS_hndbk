/*Modifying a Data Set Using the SET Statement

SET statement in the DATA step allows you to read a SAS data
set so you can add new variables, create a subset, or otherwise
modify the data set.

The SET statement
brings a SAS data set, one observation at a time, into the DATA step for processing.1

The MODIFY statement also allows you to modify a single data set. See the SAS Help and Documentation for more
information.

By default, SAS will not overwrite a data set in a DATA step that has errors.

To read a SAS data set, start with the DATA statement specifying the name of the new data set.
Then follow with the SET statement specifying the name of the old data set you want to read

If
you don’t want to create a new data set, you can specify the same name in the DATA and SET
statements


					DATA new-data-set;
						SET data-set;



*/
* Create permanent SAS data set trains;
DATA 'C:\Users\448513\Documents\My SAS Files\9.1\L6\trains';
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\Train.dat';
INPUT Time TIME5. Cars People;
RUN;


* Read the SAS data set trains with a SET statement;
DATA averagetrain;
SET 'C:\Users\448513\Documents\My SAS Files\9.1\L6\trains';
PeoplePerCar = People / Cars;
PROC PRINT DATA = averagetrain;
TITLE 'Average Number of People per Train Car';
FORMAT Time TIME5.;
RUN;
