* Read internal data into SAS data set uspresidents;
DATA uspresidents;
INPUT President $ Party $ Number;
DATALINES;
Adams F 2
Lincoln R 16
Grant R 18
Kennedy D 35
;
RUN;
