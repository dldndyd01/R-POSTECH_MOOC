par(mfrow=c(1,1))
x2<-c(1,4,9)
y2 = 2+x2
plot(x2,y2)

par(mfrow = c(2,1))
x <-seq(0,2*pi , by = 0.001)
y1 <-sin(x)
plot(x, y1, main = "sin curve")
y2 <- cos(x)
plot(x, y2, main = "cos curve")


car<-read.csv("autompg.csv")
detach(car)
attach(car)
par(mfrow = c(2,1))
plot(wt,mpg)
plot(hp,mpg)

par(mfrow = c(2,1) , mar = c(4,4,2,2))
plot(disp,mpg,col = as.integer(car$cyl))
plot(wt,mpg, col = as.integer(car$cyl))

car1<- subset(car, cyl ==4 | cyl ==6| cyl ==8)
coplot(car1$mpg ~ car1$disp | as.factor(car1$cyl),data = car1,panel = panel.smooth, rows=1)

pairs(car1[,1:6],col = as.integer(car1$cyl),main = "autompg")

plot(wt,mpg,col = as.integer(car$cyl), pch = 19)
# lm은 선형회귀모형 리니얼 모델, 
abline(lm(mpg~wt),col = "red", lwd = 2, lty =1)
# 비선형일수도있잖아!
lines(lowess(wt,mpg),col="blue",lwd =3,lty =2)
