/*Updating a Master Data Set with Transactions

The UPDATE statement is used far less than the MERGE
statement, but it is just right for those times when you have
a master data set that must be updated with bits of new
information.

A bank account is a good example of this type
of transaction-oriented data, since it is regularly updated
with credits and debits.

The UPDATE statement is similar to the MERGE statement, because both combine data sets by
matching observations on common variables.1 However, there are critical differences:

1. First, with UPDATE the resulting master data set always has just one observation for
each unique value of the common variables. That way, you don't get a new observation
for your bank account every time you deposit a paycheck.

2. Second, missing values in the transaction data set do not overwrite existing values in
the master data set. That way, you are not obliged to enter your address and tax ID
number every time you make a withdrawal.

				DATA master-data-set;
						UPDATE master-data-set transaction-data-set;
						BY variable-list;


Here are a few points to remember about the UPDATE statement.

You can specify only two data
sets: one master and one transaction

Both data sets must be sorted by their common variables.
Also, the values of those BY variables must be unique in the master data set. 


Using the bank
example, you could have many transactions for a single account, but only one observation per
account in the master data set.

*/

LIBNAME perm 'C:\Users\448513\Documents\My SAS Files\9.1\L6';
DATA perm.patientmaster;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\Admit.dat';
INPUT Account LastName $ 8-16 Address $ 17-34
BirthDate MMDDYY10. Sex $ InsCode $ 48-50 @52 LastUpdate MMDDYY10.;
RUN;
LIBNAME perm 'C:\Users\448513\Documents\My SAS Files\9.1\L6';
DATA transactions;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L6\NewAdmit.dat';
INPUT Account LastName $ 8-16 Address $ 17-34 BirthDate MMDDYY10.
Sex $ InsCode $ 48-50 @52 LastUpdate MMDDYY10.;
PROC SORT DATA = transactions;
BY Account;
* Update patient data with transactions;
DATA perm.patientmaster;
UPDATE perm.patientmaster transactions;
BY Account;
PROC PRINT DATA = perm.patientmaster;
FORMAT BirthDate LastUpdate MMDDYY10.;
TITLE 'Admissions Data';
RUN;
