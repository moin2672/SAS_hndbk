* Read an Excel spreadsheet using PROC IMPORT;
PROC IMPORT DATAFILE = 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Onions1.xls' OUT = sales REPLACE;
PROC PRINT DATA = sales;
TITLE 'SAS Data Set Read From Excel File';
RUN;

/*
PROC IMPORT DATAFILE = 'filename' OUT = data-set
DBMS = identifier REPLACE;

Type of File Extension DBMS Identifier
Microsoft Excel .xls EXCEL3
EXCEL5
EXCEL4
Lotus .wk4 WK4
. wk3 WK3
.wk1 WK1
dBase .dbf DBF


If you are reading a Microsoft Excel file, and you have more than one sheet in your file, then you
can specify which sheet to read using the following statement:
SHEET=name-of-sheet;


By default, the IMPORT procedure will take the variable names from the first row of the
spreadsheet (Microsoft Excel and Lotus only). If you do not want this, then you can add the
following statement to the procedure and SAS will name the variables F1, F2, and so on.
GETNAMES=NO;

Microsoft Access Files
then instead of using the DATAFILE= option, 
you need a DATABASE= and a DATATABLE=option as follows
PROC IMPORT DATABASE = 'database-path' DATATABLE = 'table-name'
OUT = data-set DBMS = identifier REPLACE;

Type of File Extension DBMS Identifier
Microsoft Access .mdb ACCESS5
ACCESS97

*/
