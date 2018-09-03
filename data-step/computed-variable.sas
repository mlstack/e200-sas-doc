/* Example : 단어 교정, Space 교정 */
data raw ;
input	Cstno Gender $ BirthDay Addr $20. ;
cards ;
1 녀 19611231 서울     영등포구 
2 여 20000101 경기도 용인시 
run ;
proc print ; run ;
data cleaned ;
	set raw ;
	BirthYear=year(input(put(BirthDay,z8.),yymmdd8.)) ;
	age = year(today()) - BirthYear ;
	area = substr(addr,1, index(addr,' ')) ;
	addr = compbl(addr) ;
	if Gender = '여' then Gender = '녀' ;
run ;
proc print ; run ;

/* Example : 생년월일로 부터 나이 생성 주소로 부터 지역 생성 */
data raw ;
	input	CstNo BirthDay Addr $20. ;
cards ;
1 19611231 서울     영등포구 
2 20000101 경기도 용인시 
run ;
data derived ;
	set raw ;
	BirthYear=year(input(put(BirthDay,z8.),yymmdd8.)) ;
	age = year(today()) - BirthYear ;
	area = substr(addr,1, index(addr,' ')) ;
run ;
proc print ; run ;
