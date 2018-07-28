/*
LISTING --> standard SAS output
OUTPUT --> SAS output data set
HTML --> Hypertext Markup Language
RTF --> Rich Text Format
PRINTER --> high resolution printer output1
PS --> PostScript
PCL --> Printer Control Language
PDF --> Portable Document Format
MARKUP --> markup languages including XML
DOCUMENT --> output document
*/

PROC TEMPLATE;
LIST STYLES;
RUN;

/*
Tracing and Selecting Procedure Output
--------------------------------------

ODS TRACE statement tells SAS to print information
about output objects in your SAS log

two ODS TRACE statements:

to turn on the
trace, and one to turn it off.

ODS TRACE ON;
the PROC steps you want to trace go here
RUN;
ODS TRACE OFF;

* Notice that the RUN statement comes before the ODS TRACE OFF statement
* ODS statement executes immediately—without waiting for a RUN, PROC,
or DATA statement.

*/
