## SAS SQL
```
[Tech ] SAS SQL
[Ahtor] Yibeck Lee(Yibeck.Lee@gmail.com)
```

### coalesce fuction
```
/* Example : COALESCE */
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
