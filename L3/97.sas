* Modify homegarden data set with assignment statements;
DATA homegarden;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L2\Garden.dat';
INPUT Name $ 1-7 Tomato Zucchini Peas Grapes;
Zone = 14;
Type = 'home';
Zucchini = Zucchini * 10;   /*Here:Zucchini (2nd instance) is not repeated as it was already displayed */
Total = Tomato + Zucchini + Peas + Grapes;
PerTom = (Tomato / Total) * 100;
PROC PRINT DATA = homegarden;
TITLE 'Home Gardening Survey';
RUN;

/*

NOTE: Missing values were generated as a result of performing an operation on
missing values.

*/
