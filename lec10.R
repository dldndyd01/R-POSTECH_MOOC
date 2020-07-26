# 10-1
install.packages("class")
install.packages("gmodels")
install.packages("scales")
library(class)
library(gmodels)
library(scales)

iris <- read.csv("iris.csv")
set.seed(1000)
N = nrow(iris)
tr.idx = sample(1:N,size = N*2/3, replace = FALSE)  # 1~ N까지 중에 3분의2크기만큼 랜덤 숫자 생성


iris.train <- iris[tr.idx,-5]
iris.test <- iris[-tr.idx,-5]
trainLabels <- iris[tr.idx,5]
testLabels <- iris[-tr.idx,5]

train <- iris[tr.idx,]
test <- iris[-tr.idx,]

md1<- knn(train = iris.train, test = iris.test, cl = trainLabels, k = 5)
md1
help(knn)

CrossTable(x = testLabels, y = md1, prop.chisq = FALSE)





# 10-2 knn 최적의 k 찾기
accuracy_k <- NULL
nnum<- nrow(iris.train)/2
for (kk in  c(1:nnum))
{
  set.seed(1234)
  knn_k <-knn(train = iris.train, test = iris.test,cl = trainLabels, k= kk)
  accuracy_k <- c(accuracy_k, sum(knn_k == testLabels)/length(testLabels))
}
accuracy_k
test_k <- data.frame(k = c(1:nnum), accuracy = accuracy_k [c(1:nnum)])
plot(formula = accuracy~k, data = test_k, type = "o", ylim = c(0.5,1),pch = 20, col =3)
with(test_k, text(accuracy~k,labels = k, pos = 1, cex = 0.7))

md1<- knn(train = iris.train, test = iris.test, cl = trainLabels, k =7)
md1
CrossTable(x = testLabels, y = md1, prop.chisq = FALSE)


# 10-3
install.packages("MASS")/
library(MASS)

iris.lda <- lda(Species ~.,data = train, prior = c(1/2, 1/4, 1/4))
iris.lda
testpre <- predict(iris.lda, test)
testpre
testpred1<-round(testpre$posterior, 2)
testpred1
CrossTable(x = testLabels, y = testpre$class,prob.chisq = FALSE)


# 10-4
install.packages("biotools")
install.packages("klaR")
library(klaR)
library(biotools)
boxM(iris[1:4], iris$Species)          # QDA 실시!

iris.qda<- qda(Species ~. , data = train, prior = c(1/3,1/3,1/3))
iris.qda

testpredq <- predict(iris.qda, test)
testpredq

CrossTable(x = testLabels, y= testpredq$class, prop.chisq = FALSE)
par(mfrow = c(1,2))
partimat(as.factor(iris$Species)~., data = iris, method = "lda")
partimat(as.factor(iris$Species)~., data = iris, method = "qda")
