##########################################
#3. 행과 컬럼 합치기

####
#1) rbind와 cbind
# 행 추가하기는 rbind(a,b); a에 b행을 추가
# 열 추가 cbind(a,b)
rm(list=ls())
x<-data.frame(id=c(1,2,3),name=c('terry','cath','stella'),score=c(96,99,80));
str(x) # 이렇게 하면 두번째 컬럼이 Factor가 된다.
y<-rbind(x,c(4,'yuna',80)); # 이렇게 하면 에러가 난다. 두번째 컬럼이 현재는 Factor형이기 때문에
x$name<-as.character(x$name); # 두번째 열을 문자열로 바꾼후
str(x)
y<-rbind(x,c(4,'yuna',80)); # 다시 row를 추가하면
y; #정상적으로 들어감을 볼 수 있다.

# 다음은 열을 추가하는 cbind
z<-cbind(x,city=c('seoul','sf','tokyo'))
str(z) # 이렇게 하면 새로 추가한 열을 또 factor 형이 된다.
z<-cbind(x,city=c('seoul','sf','tokyo'),stringsAsFactors=F)
str(z) # 이렇게 하면 새로 추가한 열은 문자열로 된다.
