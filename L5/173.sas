* Create an RTF file;
ODS RTF FILE = 'C:\Users\448513\Documents\My SAS Files\9.1\L5\Marine.rtf' BODYTITLE;
DATA marine;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L5\Sealife.dat';
INPUT Name $ Family $ Length @@;
PROC MEANS DATA = marine;
CLASS Family;
TITLE 'Whales and Sharks';
PROC PRINT DATA = marine;
RUN;
* Close the RTF file;
ODS RTF CLOSE;

/*Using ODS Statements to Create RTF Output

Rich Text Format (RTF)

			ODS RTF FILE = 'filename.rtf' options;

COLUMNS=n requests columnar output where n is the number of columns.

BODYTITLE by default, titles and footnotes are put into Word headers and footers.
This option, which is experimental starting with SAS 9.0, puts titles and
footnotes in the main part of the RTF document.

SASDATE by default, the date and time that appears at the top of RTF output is
when the file was last opened or printed in Word. This option tells SAS to
use the date and time when the current SAS session or job started
running.1

STYLE= specifies a style template. The default style is named RTF.


* ODS statements do not belong to either DATA steps or PROC steps. However, if you put them in
the wrong place, they won’t capture the output that you want. A good place to put the first ODS
statement is just before the PROC step (or steps) whose output you wish to capture.


Note:
If you have the system option DTRESET turned on, and you use the ODS RTF SASDATE option, then SAS will use the date
and time when the current job ran instead of when SAS started.







*/
