LIBNAME plants 'C:\Users\448513\Documents\My SAS Files\9.1\L1';
DATA plants.magnolia;
INFILE 'C:\Users\448513\Documents\My SAS Files\9.1\L1\Mag.dat';
INPUT ScientificName $ 1-14 CommonName $ 16-32 MaximumHeight
AgeBloom Type $ Color $;
PROC PRINT DATA=plants.magnolia;
RUN;
