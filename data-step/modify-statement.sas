/* Example : MODIFY */
data modify ;
input cstno age ;
cards ;
1 55
2 34
3 28
run ;
data modify ;
	modify modify ;
	age = age + 1 ;
run ; 
proc print ; run ;
