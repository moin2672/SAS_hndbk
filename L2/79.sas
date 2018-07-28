DATA music;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Bands.csv' DLM = ',' DSD MISSOVER;
INPUT BandName :$30. GigDate :MMDDYY10. EightPM NinePM TenPM ElevenPM;
PROC PRINT DATA = music;
TITLE 'Customers at Each Gig';
RUN;

/*
The DSD option The DSD (Delimiter-Sensitive Data) option for the INFILE statement

does three things for you. 
First, it ignores delimiters in data values enclosed in quotation marks.
Second, it does not read quotation marks as part of the data value. 
Third, it treats two delimiters in a row as a missing value. 
The DSD option assumes that the delimiter is a comma. 
If your delimiter is not a comma then you can use the DLM= option with the DSD option to specify the
delimiter. For example, to read a tab-delimited ASCII file with missing values indicated by two
consecutive tab characters use

INFILE 'file-specification' DLM='09'X DSD;

*/
