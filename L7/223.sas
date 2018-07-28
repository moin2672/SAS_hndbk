%LET flowertype = Ginger;
* Read the data and subset with a macro variable;
DATA flowersales;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L7\TropicalSales.dat';
INPUT CustomerID $ @6 SaleDate MMDDYY10.
@17 Variety $9. Quantity;
IF Variety = ”&flowertype”;
* Print the report using a macro variable;
PROC PRINT DATA = flowersales;
FORMAT SaleDate WORDDATE18.;
TITLE ”Sales of &flowertype”;
RUN;
