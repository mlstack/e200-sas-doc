/* Example : ARRAY */
data ar1 ;
    input cstno v_200607 v_200608 ;
    cards ;
1 10 11
2 .    22
3 30 .
run ;
data ar2(drop=i) ;
    set ar1 ;
    array ar{2} v_200607 v_200608 ;
    do i=lbound(ar) to hbound(ar) ;
        if ar{i}=. then ar{i}=0 ;
    end ;
run ;
proc print ; run ;
