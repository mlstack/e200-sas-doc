### [Title] SAS SQL
### [Ahtor] Yibeck Lee(Yibeck.Lee@gmail.com)
<hr>

### GROUP BY, SUM, MEAN, MIN, MAX
```
data CstSum ;
	input CstNo YM TrxAmt ;
cards ;
1 20060101 10000 
1 20060120 20000
2 20060113 20000
2 20060125 30000
run ;
proc sql ;
	create table Sum as
	select 	CstNo
	          ,	sum(TrxAmt) as TrxSum
	          ,	mean(TrxAmt) as TrxMean
	          ,	min(TrxAmt) as TrxMin
			  ,	max(TrxAmt) as TrxMax
	from		CstSum
	group by CstNo ;
quit ;
proc print ; run ;
```


### Full Outer Join
```
data a ;
    input cstno ym200601 ;
   cards ;
1 1100
2 2100
 ;
data b ;
    input cstno ym200602 ;
   cards ;
2 2200
3 3200
 ;
proc sql ;
    select      a.cstno as a_cstno
                  ,b.cstno as b_cstno
                  ,ym200601
                  ,ym200602
    from        a full outer join b on a.cstno = b.cstno ;
quit ;
```

### Inner Join
```
data a ;
    input cstno ym200601 ;
   cards ;
1 1100
2 2100
 ;
data b ;
    input cstno ym200602 ;
   cards ;
2 2200
3 3200
 ;
proc sql ;
    select      a.cstno
                  ,ym200601
                  ,ym200602
    from        a, b
    where     a.cstno = b.cstno ;
quit ; 
```

### Left Outer Join
```
data a ;
    input cstno ym200601 ;
   cards ;
1 1100
2 2100
 ;
data b ;
    input cstno ym200602 ;
   cards ;
2 2200
3 3200
 ;
proc sql ;
    select      a.cstno
                  ,ym200601
                  ,ym200602
    from        a left join b on a.cstno = b.cstno ;
quit ; 
```


### cross join / union
```
data one;
 input X Y $;
 datalines;
1 2
2 3
;
data two;
 input W Z $;
 datalines;
2 5
3 6
4 9
;
run;
proc sql ;
select *
from one cross join two;
quit ;
proc sql ;
select *
from one union join two;
quit ;
```

### coalesce fuction
```
data a ;
    input cstno ym200601 ;
   cards ;
1 1100
2 2100
 ;
data b ;
    input cstno ym200602 ;
   cards ;
2 2200
3 3200
 ;

proc sql ;
    select      a.cstno as a_cstno
                  ,b.cstno as b_cstno
                  ,coalesce(a_cstno, b_cstno) as cstno
                  ,ym200601
                  ,ym200602
    from        a full outer join b on a.cstno = b.cstno ;
quit ;
```


### INSERT
```
data cstymsum ;
    input crdno yymm amt ;
    cards ;
1 200601 1100
2 200601 2100
 ;
data cstsum200602 ;
    input crdno yymm amt ;
    cards ;
1 200602 1200
2 200602 2200
3 200602 3200
 ;
proc sql ;
    insert into cstymsum
    select * from cstsum200602 ;
quit ;
proc print data =cstymsum ; run ;
```
