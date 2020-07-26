2^3
4**3

7%%5# 나머지
7%/%5 #몫

m2<- matrix(1:6,ncol=3)
m2
# transpose of m2
tm2 <- t(m2)
tm2

d1 <- matrix(1:4,nrow = 2, byrow = T)
d1
det(d1)

# 역행렬 구하기
d1_inv <- solve(d1)
d1_inv

d1 %*%d1_inv   # 항등행렬 생성 !!!

a <- matrix(c(3,1,2,1),nrow = 2, ncol = 2)
b<- matrix(c(8,2),nrow = 2, ncol =1 )
# ax = b 의 해 x구하기기
solve(a,b)

x<-matrix(c(-3,-2,0,1,2,2,-3,-3,0,2,2,2,5,7,4,0,-5,-11),nrow = 6, ncol = 3)
x
dim(x)

e1<-eigen(t(x)%*%x)
e1
