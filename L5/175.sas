* Create the PDF file;
ODS PDF FILE = 'C:\Users\448513\Documents\My SAS Files\9.1\L5\Marine.pdf';
DATA marine;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L5\Sealife.dat';
INPUT Name $ Family $ Length @@;
PROC MEANS DATA = marine;
CLASS Family;
TITLE 'Whales and Sharks';
PROC PRINT DATA = marine;
RUN;
* Close the PDF file;
ODS PDF CLOSE;



/*Using ODS Statements to Create PRINTER Output

			ODS PRINTER;

Default printer: ODS PRINTER FILE = 'filename.extension' options;
PCL: ODS PCL FILE = 'filename.pcl' options;
PDF: ODS PDF FILE = 'filename.pdf' options;
PostScript: ODS PS FILE = 'filename.ps' options;

Some of the options available for this destination are

COLUMNS = n requests columnar output where n is the number of columns.
STYLE = specifies a style template. The default style is named PRINTER.



ODS destination-name CLOSE;
*/
