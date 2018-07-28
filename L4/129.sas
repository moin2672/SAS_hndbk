DATA sales;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Candy.dat';
INPUT Name $ 1-11 Class @15 DateReturned MMDDYY10. CandyType $
Quantity;
Profit = Quantity * 1.25;
PROC PRINT DATA = sales;
VAR Name DateReturned CandyType Profit;
FORMAT DateReturned DATE9. Profit DOLLAR6.2;
/*PUT DateReturned DATE9. Profit DOLLAR6.2; (It doesn't work)*/ 

TITLE 'Candy Sale Data Using Formats';
RUN;


/*

Changing the Appearance of Printed Values with Formats


Character - $formatw.
Numeric - formatw.d
Date - formatw.

FORMAT statement
----------------
 Eg: FORMAT Profit Loss DOLLAR8.2 SaleDate MMDDYY8.;  (here for a list of variable single format can be declared using FORMAT)
* FORMAT statements can go in either DATA steps or PROC steps
* If the FORMAT statement is in a "DATA step", then the format association is "permanent" and is stored with the SAS data set.
* If the FORMAT statement is in a "PROC step", then it is "temporary" —affecting only the results from that procedure.

PUT statement
-------------
You can also use formats in PUT statements when writing raw data files or
reports.

Eg: PUT Profit DOLLAR8.2 Loss DOLLAR8.2 SaleDate MMDDYY8.; (here for a list of variable single format cannot be declared using PUT statement;
so declare format for each variable)


Selected Standard Formats
-------------------------
pg.no:130
*/
