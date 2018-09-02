### %let
- assign macro variable
```
%let dsn=Newdata;
title "Display of Data Set &dsn";
```
### %put 
- display macro variable in log window
```
%let street=Maple;
%put &street ;
%let num=123;
%let address=&num &street Avenue;
%put &address ;
```

### %eval 
- integer arithmetic expressions
```
%let num=%eval(100+200); / * produces 300 * /
```
### %syseval
- float arithmetic expressions
```
%let num=%sysevalf(100+1.597); / * produces 101.597 * /
```

### %str
- macro variable including special character
```
%let state = %str( North Carolina);
%let town = %str(Taylor%'s Pond);
%let store = %nrstr(Smith&Jones);
%let mPlot = %str(
  proc gplot data = SASHELP.CLASS ;
  plot WEIGHT * HEIGHT ;
  run;);
%put &mPlot ;
&mPlot ;
```

### %macro ~ %mend 
- begin and end of macro function

```
options mlogic mprint ;
%macro temp;
 data one;
 %do i=1 %to 3;
 x&i=&i;
 %end;
 run;
%mend temp;
%temp ;
```

```
%macro second(param);
 %let a = %eval(&param); &a
%mend second;

%macro first(exp);
 %if (%second(&exp) ge 0) %then
 %put **** result >= 0 ****;
 %else
 %put **** result < 0 ****;
%mend first;

%first(1+2) ;
```
### %if %else
```
%macro whatstep(info=,mydata=);
 %if &info=print %then
 %do;
 proc print data=&mydata;
 run;
 %end;
 %else %if &info=report %then
 %do;
 options nodate nonumber ps=18 ls=70 fmtsearch=(Sasuser);
 proc report data=&mydata nowd;
 column manager dept sales;
 where sector='se';
 format manager $mgrfmt. dept $deptfmt. sales dollar11.2;
 title 'Sales for the Southeast Sector';
 run;
 %end;
%mend whatstep;
%whatstep(info=print,mydata=SASHELP.CLASS) ;
```

## macro fuction

### %scan
- search for a word specified by its number
```
%let address=123 maple avenue;
%let frstword=%scan(&address,1);
```

### %substr
- produce a substring of a character string
```
%put &sysday ;
%let day = %substr(&sysday,1,3);
%put day = &day ;
```

### symput in data step
- datastep value into macro variable
```
%macro env1 ;
 data _null_;
 x = 'a token' ;
 call symput("myvar1",x);
 run;
%mend env1;
%env1 ;
%put "&myvar1" ;
data temp;
 y = "&myvar1";
run;
```

### symput and symget
- returns the value of a specified host environment variable
```
data dusty;
 input dept $ name $ salary @@;
 datalines;
bedding Watlee 18000 bedding Ives 16000
bedding Parker 9000 bedding George 8000
bedding Joiner 8000 carpet Keller 20000
carpet Ray 12000 carpet Jones 9000
gifts Johnston 8000 gifts Matthew 19000
kitchen White 8000 kitchen Banks 14000
kitchen Marks 9000 kitchen Cannon 15000
tv Jones 9000 tv Smith 8000
tv Rogers 15000 tv Morse 16000
;
run ;
proc means noprint;
 class dept;
 var salary;
 output out=stats sum=s_sal;
run;
proc print data=stats;
 var dept s_sal;
 title "Summary of Salary Information";
 title2 "For Dusty Department Store";
run;
data _null_;
 set stats;
 if _n_=1 then call symput('s_tot',s_sal);
 else call symput('s'||dept,s_sal);
run;
%put &s_tot ;
%put &sbedding ;


data new;
 set dusty;
 pctdept=(salary/symget('s'||dept))*100;
 pcttot=(salary/&s_tot)*100;
run;
proc print data=new split="*";
 label dept ="Department"
 name ="Employee"
 pctdept="Percent of *Department* Salary"
 pcttot ="Percent of * Store * Salary";
 format pctdept pcttot 4.1;
 title "Salary Profiles for Employees";
 title2 "of Dusty Department Store";
run;
```

