DATA natparks;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L3\Parks.dat';
INPUT Name $ 1-21 Type $ Region $ Museums Camping;
* PROC REPORT with breaks;
PROC REPORT DATA = natparks NOWINDOWS HEADLINE;
COLUMN Name Region Museums Camping;
DEFINE Region / ORDER;
BREAK AFTER Region / SUMMARIZE OL SKIP;
RBREAK AFTER / SUMMARIZE OL SKIP;
TITLE 'National Parks';
RUN;

/*
Adding Summary Breaks to PROC REPORT Output

Two kinds of statements allow you to insert breaks into a report

BREAK --> statement adds a break for each unique value of the variable you specify
RBREAK --> statement does the same for the entire report (or BY-group if you are using a BY statement)

			BREAK location variable / options;
			RBREAK location / options;


location --> has two possible valuesBEFORE or AFTERdepending on whether you want
the break to precede or follow that particular section of the report.

The options that come after
the slash tell SAS what kind of break to insert

OL --> draws a line over the break
PAGE --> starts a new page
SKIP --> inserts a blank line
SUMMARIZE --> inserts sums of numeric variables
UL --> draws a line under the break


* Notice that the BREAK statement requires you to specify a variable, but the RBREAK statement
does not.
* That’s because the RBREAK statement produces only one break (at the beginning or
end), while the BREAK statement produces one break for every unique value of the variable you
specify.
* That variable must be either a group or order variable and therefore must also be listed
in a DEFINE statement with either the GROUP or ORDER usage option
** You can use an
RBREAK statement in any report, but you can use BREAK only if you have at least one group or
order variable.

Note:
All these options work for the Listing destination; not all work for other destinations. At the time this book was written,
PAGE and SUMMARIZE worked for HTML, RTF, and PDF; OL, UL and SKIP were ignored.






*/
