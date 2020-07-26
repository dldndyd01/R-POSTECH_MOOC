# 11-1
# install.packages("e1071")
library(e1071)
iris <-read.csv("iris.csv")
attach(iris)
detach(iris)
m1<- svm(Species ~ .,data =  iris)
summary(m1)

x<-iris[,-5]
pred <- predict(m1,x)
y<-iris[,5]
table(pred,y)

plot(m1, iris, Petal.Width~Petal.Length, slice = list(Sepal.Width=3,Sepal.Length=4))

# 11-2
# install.packages("caret")
library(caret)
set.seed(1000)
N = nrow(iris)
tr.idx = sample(1:N, size = N*2/3, replace = FALSE)
y = iris[,5]
train = iris[tr.idx,]
test = iris[-tr.idx,]

m1 <- svm(Species~., data = train)
summary(m1)
pred11 <- predict(m1,test)
confusionMatrix(pred11,test$Species)

m2 <- svm(Species~., data = train,kernel = "polynomial")
summary(m2)
pred12 <- predict(m2,test)
confusionMatrix(pred12,test$Species)

m3 <- svm(Species~., data = train, kernel = "sigmoid")
summary(m3)
pred13 <- predict(m3,test)
confusionMatrix(pred13,test$Species)

# 11-3
cancer<- read.csv("cancer.csv")
head(cancer,n=10)

cancer<- cancer[,names(cancer) != "X1"]
head(cancer,10)
attach(cancer)
detach(cancer)

set.seed(1000)
N = nrow(cancer)
set.seed(998)

tr.idx = sample(1:N, size =N*2/3 , replace = FALSE)

train <- cancer[tr.idx,]
test <- cancer[-tr.idx,]

