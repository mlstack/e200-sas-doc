/* Example : RETAIN */
data cum1 ;
    input trxno v_0607 v_0608 ;
    cards ;
1 1 2
2 2 3
3 3 4
run ;
data cum2 ;
    set cum1 ;
	retain v_retain ;
	v_msum = v_0607 + v_0608 ;
	output ;
    v_retain = v_msum ; ;    
run ;
/* Example : ARRAY */
data ar1 ;
    input cstno v_200607 v_200608 ;
    cards ;
1 10 11
2 .    22
3 30 .
run ;
