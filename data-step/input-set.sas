libname src "C:\_DA_\source" ;
libname	trg "C:\_DA_\target"	;
libname out "C:\_DA_\output" ;
proc contents data = src._all_ ; run ;
/* contents: 라이브러리 안의 테이블 정보를 조회*/
proc contents data = src._all_ nods ; run ; /* _all_ : 모든 sasdata를 보겠다는 의미 nods: no details */
proc contents data = sashelp._all_ nods ; run ;
proc contents data = src.cstmstr varnum ; run ; /* varnum:변수저장순서로 조회*/
/* Example: Adding Observations with SET Statement */
data src.cstsum200601 ;
    input crdno yymm amt ;
    cards ;
1 200601 1100
2 200601 2100
 ;
data src.cstsum200602 ;
    input crdno yymm amt ;
    cards ;
1 200602 1200
2 200602 2200
3 200602 3200
 ;
data src.cstymsum ;
    set cstsum200601 cstsum200602 ;
 ;
run ;
proc print data=src.cstymsum ; run ;
proc means data = src.cstymsum  ;
class yymm ;
var amt ;
run ;
proc contents data = src._all_ nods ; run ;
