/*Using SAS Data Set Options

the SAS language has three basic types of options: 
1. system options, 
2. statement options,
and 
3. data set options

System options have the most global influence, followed by statement
options, with data set options having the most limited effect.

System options
--------------
System options are those that stay in effect for the duration of your job or session

These options affect how SAS operates, and are usually issued when you invoke SAS or via an OPTIONS
statement.

System options include the CENTER option, which tells SAS to center all output, and
the LINESIZE= option setting the maximum line length for output

Statement options
-----------------
Statement options appear in individual statements and influence how SAS runs that particular
DATA or PROC step.

The NOPRINT option in PROC MEANS, for example, tells SAS not to
produce a printed report

DATA= is a statement option that tells SAS which data set to use for a
procedure.

You can use DATA= in any procedure that reads a SAS data set. Without it, SAS
defaults to the most recently created data set.

In contrast, data set options affect only how SAS reads or writes an individual data set. You can
use data set options in DATA steps (in DATA, SET, MERGE, or UPDATE statements) or in
PROC steps (in conjuction with a DATA= statement option).
To use a data set option, you simply
put it between parentheses directly following the data set name. 

These are the most frequently
used data set options:

KEEP = variable-list --------------> tells SAS which variables to keep.
DROP = variable-list --------------> tells SAS which variables to drop.
RENAME = (oldvar = newvar) --------> tells SAS to rename certain variables.
FIRSTOBS = n  ---------------------> tells SAS to start reading at observation n.
OBS = n  --------------------------> tells SAS to stop reading at observation n.
IN = new-var-name  ----------------> creates a temporary variable for tracking whether that data set contributed to the current observation


Selecting and renaming variables Here are examples of the KEEP=, DROP=, and

RENAME= data set options:

DATA small;
SET animals (KEEP = Cat Mouse Rabbit);

PROC PRINT DATA = animals (DROP = Cat Mouse Rabbit);

DATA animals (RENAME = (Cat = Feline Dog = Canine));
SET animals;

PROC PRINT DATA = animals (RENAME =(Cat = Feline Dog = Canine));


Note:
-----
The DROP=, KEEP=, and RENAME= options are similar to the DROP, KEEP, and RENAME
statements.

However, the statements apply to all data sets named in the DATA statement while the
options apply only to the particular data set whose name they follow

Also, the statements are
more limited than the options since they can be used only in DATA steps, and apply only to the
data set being created.

In contrast, the data set options can be used in DATA or PROC steps and
can apply to input or output data sets

Please note that these options do not change input data sets;
they change only what is read from input data sets.


Selecting observations by observation number
--------------------------------------------
the FIRSTOBS= and OBS=
data set options together to tell SAS which observations to read from a data set

Eg:
		DATA animals;
			SET animals (FIRSTOBS = 101 OBS = 120);
		PROC PRINT DATA = animals (FIRSTOBS = 101 OBS = 120);

Tracking observations
---------------------
IN= option is somewhat different from other options covered
here.

While the other options affect existing variables, IN= creates a new variable. That new
variable is temporary and has the name you specify in the option


Eg:
	DATA animals;
		MERGE animals (IN = InAnimals) habitat (IN = InHabitat);
		BY Species;

In this example, SAS would
create two temporary variables, one named InAnimals and the other named InHabitat:

* These variables exist only for the duration of the current DATA step and are not added to the
data set being created.

* SAS gives IN= variables a value of 0 if that data set did not contribute to
the current observation and a value of 1 if it did.

* You can use the IN= variable to track, select, or
eliminate observations based on the data set of origin

*/
