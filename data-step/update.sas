
/* Example : UPDATE */
data update_bf ;
    input cstno area $ ;
    cards ;
1 서울
2 부산
run ;

data update_af ;
    input cstno area $ ;
    cards ;
1 부산
2 서울
run ;

data update_bf ;
    update update_bf update_af ; by cstno ;
run ;
proc print ;run ;
