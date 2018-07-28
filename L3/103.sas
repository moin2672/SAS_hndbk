DATA sportscars;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L2\Cars.dat';
INPUT Model $ Year Make $ Seats Color $;
IF Year < 1975 THEN Status = 'classic';
IF Model = 'Corvette' OR Model = 'Camaro' THEN Make = 'Chevy';
IF Model = 'Miata' THEN DO; /*use of DO-THEN to add more than one statement in action section of IF condition*/
Make = 'Mazda';
Seats = 2;
END;
PROC PRINT DATA = sportscars;
TITLE "Eddy's Excellent Emporium of Used Sports Cars";
RUN;
