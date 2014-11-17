##########################################
#2. 파일 입출력
#1) CSV 파일 읽고 쓰기

#먼저 데이타 프레임을 만든다.
x<-data.frame(id=c(1,2,3),name=c('terry','cath','stella'),score=c(96,99,80));
#파일에 쓴다
write.csv(x,'d.csv',row.names=FALSE) # d.csv 파일에 쓴다. row.names=FALSE이기 때문에, 행라벨(행번호)는 생략된다.
getwd(); # 현재 working directory 리턴
dir('.'); # 지정 디렉토리의 파일 목록 리턴

#파일에서 읽기
y<-read.csv('d.csv');
y;
str(y); # 그냥 읽으면 문자열이 factor (cf.enumeration)으로 읽힌다.
 
y<-read.csv('d.csv',stringsAsFactors=FALSE); # 문자열을 Factor가 아니라 문자열로 읽이 위함
str(y);

#####
#2) 객체 저장하기/읽기
x<-data.frame(id=c(1,2,3),name=c('terry','cath','stella'),score=c(96,99,80));
save(x,file='x.data'); # x 객체를 바이너리 형태로 파일에 저장한다. 계산 중간값,결과,모델등을 저장할때 유용하게 사용될 수 있다.
rm(list=ls())
load('x.data') #다시 x 객체를 파일에서 읽어드린다. (x 변수로 그대로 읽힌다.)
