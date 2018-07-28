/*Creating SAS Data Sets from Procedure Output

ODS OUTPUT statement

ODS OUTPUT output-object = new-data-set;


The ODS OUTPUT statement does not belong to either a DATA or PROC step, but you need to be
careful where you put it in your program. The ODS OUTPUT statement opens a SAS data set and
waits for the correct procedure output.

The data set remains open until the next encounter with the
end of a PROC step. Because the ODS OUTPUT statement executes immediately, it will apply to
whatever PROC is currently being processed, or it will apply to the next PROC if there is not a
current PROC.

To ensure that you get the correct output, we recommend that you put the ODS
OUTPUT statement after your PROC statement, and before the next PROC, DATA, or RUN
statement.




*/


DATA giant;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L5\Tomatoes.dat' DSD;
INPUT Name :$15. Color $ Days Weight;
PROC TABULATE DATA = giant;
CLASS Color;
VAR Days Weight;
TABLE Color ALL, (Days Weight) * MEAN;
TITLE 'Standard TABULATE Output';
ODS OUTPUT Table = tabout;
RUN;
PROC PRINT DATA = tabout;
TITLE 'OUTPUT SAS Data Set from TABULATE';
RUN;
