# 15-1
iris <- read.csv("iris.csv")
attach(iris)  

cor(iris[1:4])  

ir.pca<- prcomp(iris[,1:4], center=T, scale.=T)
ir.pca

summary(ir.pca)

plot(ir.pca, type = "l")
screeplot(ir.pca)

PRC<- as.matrix(iris[,1:4]) %*% ir.pca$rotation
head(PRC)
iris.pc<- cbind(as.data.frame(PRC), Species)
head(iris.pc)

library(e1071)

m1<- svm(Species ~., data = iris.pc, kernel="linear")

# 15-2

wine<-read.csv("wine_aroma.csv")
attach(wine)
head(wine)

cor(wine[1:9])

wi.pca <- prcomp(wine[1:9], center= T, scale.= F)
wi.pca
summary(wi.pca)
plot(wi.pca, type = "l")

PRC<- as.matrix(wine[,1:9])%*%wi.pca$rotation
head(PRC)

wine.pc<- cbind(as.data.frame(PRC),Aroma)
head(wine.pc)

fit1<- lm(Aroma~PC1+PC2+PC3+PC4, data=wine.pc)
fit1
summary(fit1)

fit2<- lm(Aroma~., data= wine.pc)
fit2
summary(fit2)

fit3<- lm(Aroma~.,data = wine)
summary(fit3)
layout(matrix(c(1,2,3,4),2,2))
plot(fit3)

# 15-3
# install.packages("pls")
library(pls)


data(gasoline)
par(mfrow=c(1,1))
hist(gasoline$octane, col=3)

gasTrain <- gasoline[1:50,]
gasTest<- gasoline[51:60,]

ga.pca <- prcomp(gasoline$NIR, center=T, scale.=F)
ga.pca
summary(ga.pca)
plot(ga.pca,type="l")

gas1 <- plsr(octane~NIR, ncomp = 10, data = gasTrain, validation= "LOO")
summary(gas1)

plot(RMSEP(gas1), legendpos = "topright", pch = 46, cex = 1.0, main = "Cross-validation for # of LV")
plot(gas1, ncomp = 2, asp =1, line = TRUE, cex = 1.5)

explvar(gas1)

ypred<- predict(gas1, ncomp = 2, newdata = gasTest)
y<- gasoline$octane[51:60]

sqrt((sum(y-ypred)^2)/10)

RMSEP(gas1, newdata = gasTest)
out1<- cbind(y, ypred)
write.csv(out1, file = "out1.csv", row.names = FALSE)
