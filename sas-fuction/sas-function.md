## SAS Function

### put : returns a value using a specified format.
### input : returns the value that is produced when SAS converts an expression using the specified informat.
```
numdate=122591;
chardate=put(numdate,z6.);
sasdate=input(chardate,mmddyy6.);
```
```
data testin;
   input sale $9.;
   fmtsale=input(sale,comma9.);
   datalines;
2,115,353
;
run ;
```
### putc : to specify a character format at run time
```
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
```


### find
```
find(TEAM,'Seat')
find(lower(TEAM),'seat')
```

### count
```
count(TEAM,'s')  
```

### index
```
index('ABC.DEF(X=Y)','X=Y'')
```


