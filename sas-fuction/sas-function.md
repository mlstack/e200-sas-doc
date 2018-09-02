## SAS Function

### put and input
```
numdate=122591;
chardate=put(numdate,z6.);
sasdate=input(chardate,mmddyy6.);
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


