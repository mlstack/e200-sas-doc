### Subquery

#### where with subquery
```
select *
from    TABLE
where value gt (select mean(value) from table)
```

### table with subquery
```
select 
    T1.A
 ,  T1.B
 ,  T1.C
 ,  T2.Z
from (select A, B, C from TABLE_1 where VALUE > 10) T1
left joint TABLE_2 T2
on T1.A = T2.A
```
