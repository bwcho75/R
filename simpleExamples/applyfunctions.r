####
#2) apply 계열 함수
# 배열,행렬,벡터,리스트 등에 함수를 적용하고 결과를 반환
# apply : 배열,행렬 → 배열,행렬 apply(변수,방향=1:행방향/가로방향, 2:열방향/세로방향,함수) 참고, 행렬은 2차원 배열, 배열은 다차원 행렬의 개념이다.
# lapply : 벡터,리스트 → 리스트
# sapply : 벡터,리스트 → 배열,행렬,벡터
# tapply : 벡터 →(데이타를 그룹으로 묶은후)→
# mapply
# 일괄 연산이기 때문에, for loop를 도는것 보다 빠르다.!! 반드시 익혀놓도록 하자
# apply 에 대한 설명은 https://nsaunders.wordpress.com/2010/08/20/a-brief-introduction-to-apply-in-r/ 에 잘 나와 있음

##
#apply 함수 테스트

# matrix에 적용
rm(list=ls())
d<-matrix(1:9,ncol=3)
str(d)
d
apply(d,1,sum)
apply(d,2,sum)

# array에 적용
a<-array(1:12,dim=c(3,2,2))
str(a)
a
apply(a,1,sum)
apply(a,2,sum)

# 참고: 행의 합과, 열의 합은 많이 사용되서 colSums,colMeans, rowSums,rowMeans 로 미리 함수가 정해져있음
rowSums(a)
rowMeans(a)

##
# lapply (리스트를 반환한다.), R에서 리스트는 Hash와 같이 Key/Value의 개념이고,Key를 정의안하면, Key는 [[1]],[[2]]식으로 인덱스로 지정된다.
# 참고 리스트를 벡터로 변환할때는 unlist를 사용하면 된다.
result<-lapply(c(1:3),function(x){x*2})
result
str(result) # 리스트형으로 반환됨을 볼 수 있음
uresult<-unlist(result)
str(uresult)

x<-list(a=2:100,b=1:3)
lapply(x,mean)
ux<-unlist(lapply(x,mean)) # 그냥unlist하면 이름이 보관된다./
ux 
str(ux)
ux[1] # 리턴값이 1행:a, 2행:51로 첫행에 컬럼명으로 list key가 저장된다.
ux2<-unlist(lapply(x,mean),use.names=F)
ux2 # 첫행에서 컬럼명을 빼버린다.

d=as.list(colMeans(iris[,1:4])) 
d
df <- as.data.frame(d,nrow=1,byrow=T)
df
View(df)
#또는
d=lapply(iris[,1:4],mean)
d
df <- as.data.frame(d,nrow=1,byrow=T)
df
# d=as.list를 안하거나, d=lapply를 안하면, 리턴값이 벡터로 와서, dataframe에서 행/열이 바뀌어 버림. 이걸 다시 바꿀려면 전치행렬 t(x0하면됨) 

##
# sapply
# lapply와 input은 같지만 리턴은 vector,matrix,array (즉 행렬행으로 리턴)
rm(list=ls())
x<-sapply(iris[,1:4],mean)
str(x)
x
xf=as.data.frame(t(x))
xf
View(xf)

###
# tapply 
# 그룹별로 함수를 적용할 수 있음
# 그룹은 색인을 정의해서 그 단위별로 그룹핑 함
index<-c(1:10%%2)
tapply(1:10,index,sum) # tappy(1:10,c(1 0 1 0 1 0 1 0 1 0),sum)과 동일, 1,0 두개의 그룹이 있고, 첫번째 값은 1 로 분류,두번째 값은 2로
# 분류한꼴

###
# mapply
# sapply와 비슷하지만 함수에 여러개의 인자를 동시에 올릴 수 있다.
mapply(sum,c(1:10),c(21,30),c(31,40)) # sum(1+21+31), sum(2+22+32),... sum(10+30+40) 과 
