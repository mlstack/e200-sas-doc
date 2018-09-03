data _null_;
   a = 'ABC.DEF(X=Y)';
   b = 'X=Y';
   x = index(a,b);
   put x=;
run;

DATA _NULL_ ;   X = TODAY() ;   PUT ‘X=  ‘   X   MMDDYY8. ; RUN;

proc format;
   value typefmt 1='$groupx' 
                 2='$groupy'
                 3='$groupz';
   value $groupx 'positive'='agree'
                 'negative'='disagree'
                 'neutral'='notsure ';
   value $groupy 'positive'='accept'
                 'negative'='reject'
                 'neutral'='possible';

   value $groupz 'positive'='pass    '
                 'negative'='fail'
                 'neutral'='retest';
run;
data answers;
   length word $ 8;
   input type response $;
   respfmt = put(type, typefmt.);
   word = putc(response, respfmt);
   datalines;
1 positive
1 negative
1 neutral
2 positive
2 negative
2 neutral
3 positive
3 negative
3 neutral
;
run ;

data firstlast;
   input String $60.;
   First_Word=scan(string, 1);
   Last_Word=scan(string, -1);
   datalines4;
Jack and Jill
& Bob & Carol & Ted & Alice &
Leonardo
! $ % & ( ) * + , - . / ;
;;;;
proc print data=firstlast;
run;
