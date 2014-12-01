library(mlbench)
data(Ozone)
plot(Ozone$V8,Ozone$V9)

# x,y 축 이름 바꾸기
plot(Ozone$V8,Ozone$V9, xlab="Sandburg temp",ylab="El Monte temp")

# 그래프 이름 지정하기
plot(Ozone$V8,Ozone$V9, xlab="Sandburg temp",ylab="El Monte temp",main="Ozone")

# 점의 종류 변경하기
plot(Ozone$V8,Ozone$V9, xlab="Sandburg temp",ylab="El Monte temp",main="Ozone",pch=20)
plot(Ozone$V8,Ozone$V9, xlab="Sandburg temp",ylab="El Monte temp",main="Ozone",pch='+')

# 점의 크기 조정
# 기본값은 1
plot(Ozone$V8,Ozone$V9, xlab="Sandburg temp",ylab="El Monte temp",main="Ozone",pch=20,cex=0.5)

# 색깔 조정
plot(Ozone$V8,Ozone$V9, xlab="Sandburg temp",ylab="El Monte temp",main="Ozone"
     ,pch=20,cex=0.5,col="#FF0000")

# X,Y 좌표축의 범위
plot(Ozone$V8,Ozone$V9, xlab="Sandburg temp",ylab="El Monte temp",main="Ozone"
     ,pch=20,cex=0.5,col="#FF0000",xlim=c(0,50),ylim=c(0,40))

# 그래프의 유형
# 산점도 그래프
data(cars)
str(cars)
plot(cars)

# 꺽은선 그래프
plot(cars,type="l")
plot(cars,type="b") # 점과 선을 같이 그리되, 점과 선이 중첩되지 않게 그림
plot(cars,type="o") # 점과 선을 같이 그리되, 점과 선이 중첩되도록 그립

# 선의 유형 지정
# 0 그리지 않음
# 1 실선 (기본)
# 2 대시
# 3 점
# 4 점과 대시
# 5 긴 대시
# 6 두개의 대시
plot(cars,type="l",lty=4) 

#그래프의 배열
#여러개의 그래프를 한 화면에 그리고 싶을때
# 색깔 조정
# par를 이용하며 mfrow<-c(행,열)로 설정 c(1,2)는 한줄에 두개의 그래프를 가로로 그림
par(mfrow=c(1,2))
plot(Ozone$V8,Ozone$V9, xlab="Sandburg temp",ylab="El Monte temp",main="Ozone"
     ,pch=20,cex=0.5,col="#FF0000")
plot(cars,type="o") # 점과 선을 같이 그리되, 점과 선이 중첩되도록 그립
par(mfrow=c(1,1))
# Jitter
# 같은 값의 그래프를 겹쳐서 그릴때, 여러번 겹쳐서 표시되는 현상을 줄이고
# 출력되는 값을 조금씩 움직여서 안 겹치게 함
head(Ozone$V8)
head(jitter(Ozone$V8))
# 두개의 값이 약간씩 다르게 출력됨을 확인할 수 있음
plot(Ozone$V6,Ozone$v7)
plot(jitter(Ozone$V6),jitter(Ozone$v7),col="#FF0000")

################
## 기본 그래프
################

# 점그리기
# 기존 plot에 점을 찍는다.
plot(iris$Sepal.Width,iris$Sepal.Length)
points(iris$Sepal.Width,iris$Petal.Length,col="#FF0000",pch="+")

# 선그리기
# points 함수와 마찬가지로 기존 그래프에 새로운 선을 그림
x<-seq(0,2*pi,0.1)
plot(x,sin(x))
lines(x,cos(x),col="#ff0000")

# 추세선 찾기 ★★★★
# lowess ax^2+bx+c 형태의 그래프를 그림
plot(cars)
lines(lowess(cars))
lines(loess(cars),col="#ff0000")

# 비모수적 회귀함수 loess,ksmooth,smooth.spline,earth

# y=ax+b 형태의 직선 그리기
# y=h 형태의 직선 그리기 ★
# x=v 형태의 직선 그리기 ★
plot(cars)
abline(a=-5,b=3.5,col="#ff0000")
abline(h=mean(cars$dist),col="#00ff00")
abline(v=mean(cars$speed),col="#0000ff")
lines(lowess(cars))

#곡선 그리기
#curve(공식,x축의 시작,x축의 끝)
curve(sin,0,10)

######################################
## 선형 회귀
######################################
m<-lm(dist~speed,data=cars)
# lm은 데이타로 부터 선형 회귀 모델을 만듬
# 위의 모델은 dist = a+b*speed+c 형의 수식이고, c는 오차. (a+b*speed로 부터 차이)
# Intercept가 a값, speed라고 나오는 값이 b값 
# 참고 : 선형 회귀 용어 : 종속 변수, 설명 변수
# speed는 설명 변수, dist는 종속 변수

plot(cars)
abline(m) # 1차 함수 그래프

###
## 선형 회귀 모델로 예측 하기
p<-predict(m,interval="confidence")
# p에서 fit값은 선형회귀 그래프상 값
# p에서 lwr는 신뢰구간의 하한
# p에서 upr는 신뢰구간의 상한

points(cars$speed,p$fit)
lines(cars$speed,p[1:50,"upr"],col="#00ff00")
lines(cars$speed,p[1:50,"lwr"],col="#0000ff")

# 문자열 출력
text(10,15,"Hello")
text(cars$speed,p[1:50,"lwr"]) # 출력할 문자열을 안 지정하면 y값이 출력됨

## 그래프에 그려진 데이타 식별
plot(cars,cex=0.5)
identify(cars$speed,cars$dist,labels="cars$dist")

# 범례 표현 (그래프 설명 라벨 그리는것)
plot(iris$Sepal.Width,iris$Sepal.Length,xlab="width",ylab="length")
legend("topright",legend=c("Sepal","Petal"),pch=c(20,43),col=c("black","red"),bg="gray")
