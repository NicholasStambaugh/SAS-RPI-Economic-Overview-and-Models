proc import datafile="/home/u62896626/sasuser.v94/wageenew.csv"replace out=wage dbms=csv; 
run;

proc means data=wage maxdec=3;
var diversity jobs med_earn med_earn_hour exp_change males females comp_effect gvsu_comp;
title "Numerical Summary Statistics";
title2 "Nicholas Stambaugh"; run;

proc sgplot data=wage;
HISTOGRAM med_earn_hour;
title "Histogram: Median Hourly Earnings";
title2 "Nicholas Stambaugh"; run;


proc sgplot data=wage;
VBOX med_earn;
title "Boxplot: Median Wage";
title2 "Nicholas Stambaugh"; run;

proc sgplot
data=wage;
REG X= med_earn Y=jobs;
title "Scatterplot: Median Earnings vs. Jobs";
title2 "Nicholas Stambaugh";
run;

proc sgplot
data=wage;
REG X= jobs Y=med_earn_hour;
title "Scatterplot: Median Hourly Earnings vs. Jobs";
title2 "Nicholas Stambaugh";
run;

proc sgplot
data=wage;
REG X= med_earn Y=jobs;
title "Scatterplot: Median Earnings vs. Jobs";
title2 "Nicholas Stambaugh";
run;

PROC CORR data=wage NOSIMPLE;
VAR med_earn; WITH jobs;
TITLE "Correlation Coefficient";
TITLE2 "Nicholas Stambaugh"; RUN;

ods graphics on;
proc reg data=wage plots=diagnostics;
model diversity = med_earn jobs males females gvsu_comp exp_change/ CLB CLM CLI;
ID desc;
title "Effects on Diversity by Jobs";
title2 "Nicholas Stambaugh";

ods graphics on;
proc reg data=wage plots=diagnostics;
model males = med_earn jobs gvsu_comp females diversity exp_change/ CLB CLM CLI;
ID desc;
title "Effects on Male Workforce";
title2 "Nicholas Stambaugh";

ods graphics on;
proc reg data=wage plots=diagnostics;
model females = med_earn jobs males diversity gvsu_comp exp_change/ CLB CLM CLI;
ID desc;
title "Effects on Females Workforce";
title2 "Nicholas Stambaugh";


