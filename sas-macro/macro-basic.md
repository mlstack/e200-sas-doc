### %str
```
%let state=%str( North Carolina);
%let town=%str(Taylor%'s Pond);
%let store=%nrstr(Smith&Jones);
%let plotit=%str(
  proc plot;
  plot income*age;
  run;);
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
