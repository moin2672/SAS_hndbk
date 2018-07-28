* Write a report with FILE and PUT statements;
DATA _NULL_;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Candy.dat';
INPUT Name $ 1-11 Class @15 DateReturned MMDDYY10. CandyType $ Quantity;
Profit = Quantity * 1.25;
FILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\as.txt' PRINT; /*Students.rep*/
TITLE;
/*TITLE 'Sample title';*/ /*(use this to find the difference)*/
PUT @5 'Candy sales report for ' Name 'from classroom ' Class
 //@5 'Congratulations! You sold ' Quantity 'boxes of candy'
/ @5 'and earned ' Profit DOLLAR6.2 ' for our field trip.';
PUT _PAGE_;
RUN;


/*
ABOUT GIVEN PROGRAM
--------------------

1. _NULL_ tells SAS not to bother writing a SAS data set (since the goal is to create a report not a
data set), and makes the program run slightly faster.

2. The FILE statement creates the output file
for the report, and the PRINT option tells SAS to include carriage returns and page breaks

3. The null TITLE statement tells SAS to eliminate all automatic titles.

4. The first PUT statement in this program starts with a pointer, @5, telling SAS to go to column 5.

5. The variables Name, Class, and Quantity are printed in list style whereas Profit
is printed using formatted style and the DOLLAR6.2 format.

6. A slash line pointer tells SAS to skip
to the next line; two slashes skips two lines. You could use multiple PUT statements instead of
slashes to skip lines "because SAS goes to a new line every time there is a new PUT statement".
/ represents next line (enter new line)

7. PUT _PAGE_ inserts a page break after each student’s report


*/


/*
Writing Simple Custom Reports

PROC PRINT is flexible and easy to use. Still, there are times when PROC PRINT just won’t do:

You can use the flexibility of the DATA step, and format to your heart’s content.
You can write data in a DATA step the same way you read data—but in reverse. Instead of using an INFILE statement, you use a FILE statement;
instead of INPUT statements, you use PUT statements.

This is similar to writing a raw data file in a DATA step (section 9.5), but to write a
report you use the "PRINT" option telling SAS to include the carriage returns and page breaks
needed for printing.

		FILE ‘file-specification’ PRINT;


* Like INPUT statements, PUT statements can be in list, column, or formatted style, but since SAS
already knows whether a variable is numeric or character, you don’t have to put a $ after
character variables.

If you use list format, SAS will automatically put a space between each
variable. If you use column or formatted styles of PUT statements, SAS will put the variables
wherever you specify.

You can control spacing with the same pointer controls that INPUT
statements use: @n to move to column n, +n to move n columns, / to skip to the next line, #n to
skip to line n, and the trailing @ to hold the current line. In addition to printing variables, you
can insert a text string by simply enclosing it in quotation marks


*/
