# 12-1

# install.packages("tree")
library(tree)
library(caret)
library(dplyr)
library(caret)
iris <- read.csv("iris.csv")
attach(iris)
# detach(iris)

tr.idx <- sample(1:150, size = 100)



train <- iris[tr.idx,]
test <-iris[-tr.idx,]

treemod <- tree(Species ~ ., train)
treemod
plot(treemod)
text(treemod,cex = 1)

cv.tr <- cv.tree(treemod, FUN = prune.misclass)
cv.tr
plot(cv.tr)

prune.tr <- prune.misclass(treemod, best = 3)
plot(prune.tr)
text(prune.tr,cex = 1)

treepred <- predict(prune.tr,test,type = "class")
confusionMatrix(treepred, test$Species)

# 12-2
# install.packages("rpart")
# install.packages("party")
library(rpart)
library(party)

cl1<- rpart(Species~., data = train)
plot(cl1)
text(cl1, cex = 0.5)

printcp(cl1)
plotcp(cl1)
pcl1 <- prune(cl1, cp = cl1$cptable[which.min(cl1$cptable[,"xerror"]),"CP"])
plot(pcl1)
text(pcl1)
pred2 <- predict(cl1,test,type = "class")
confusionMatrix(pred2,test$Species)

partymod <- ctree(Species ~., data= train)
plot(partymod)

partypred <- predict(partymod, test)
confusionMatrix(partypred, test$Species)

# 12-3
install.packages("randomForest")
library(randomForest)
rf_out1 <- randomForest(Species~., data=train, importance =T)
rf_out1

rf_out2 <- randomForest(Species~., data=train, importance = T, mtry = 4)
rf_out2

round(importance(rf_out2),2)
randomForest::importance(rf_out2)
varImpPlot(rf_out2)

rfpred <- predict(rf_out2, test)
confusionMatrix(rfpred, test$Species)
