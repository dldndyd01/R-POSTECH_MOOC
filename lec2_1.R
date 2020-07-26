x<-c(1,3,5,7,9)
x[3]

# subset
x[-1]

x1 <- x[-c(1,2)]
x1

x2<- x[-c(1:3)]
x2

y1<-seq(0,10, length = 20)
y1
y2<-seq(0,10,by = 0.5)
y2

z1 <- rep(1:4,2)
z1
z2<- rep(1:2,5)
z2

c1 <- c(2,4,6,8,10)
c2 <- cbind(x,c1)
c2

c3 <-rbind(x,c1)
c3

m1 <- matrix(1:10,nrow = 2)
m1
m2 <- matrix(1:6, ncol = 3)
m2
# 1행부터 채우는게 디폴트임, byrow = T이므로 이 경우 1행부터 채우긴함
m3 <-matrix(1:6,  nrow =2, byrow = T)
m3

a1 <- array(c(1:18),dim = c(3,3,2))
a1
