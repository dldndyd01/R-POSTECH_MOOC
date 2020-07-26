# 9-1
car <- read.csv("autompg.csv")
head(car)
str(car)
attach(car)
detach(car)
r1 <- lm( mpg~ disp + hp + wt+accler , data = car)
summary(r1)

var1 <- c("mpg","disp","hp","wt","accler")
pairs(car[var1], main = "Autompg", cex = 1 ,  col = as.integer(car$cyl))

# 9-2
step(r1, direction = "both")

r2 <- lm(mpg~ disp + wt + accler, data = car)
summary(r2)

layout(matrix(c(1,2,3,4),2,2))
plot(r2)

var2 <- c("disp","hp","wt","accler")
cor(car[var2])

install.packages("car")  
library(car)
vif(lm(mpg~disp + hp+wt+accler,data = car))

summary(lm(car$mpg~car$disp))
summary(lm(car$mpg~car$hp))
summary(lm(car$mpg~car$wt))
summary(lm(car$mpg~car$accler))

# 9-4
iris <- read.csv("iris.csv")
head(iris)
set.seed(1000)
set.seed(100)
sample.kind="Rounding"
N = nrow(iris)
tr.idx <- sample(1:N, size = N*2/3 , replace = FALSE)
tr.idx

iris.train<- iris[tr.idx , -5]
iris.test <- iris[-tr.idx, 5]

trainLabels <- iris[tr.idx, 5]
testLabels  <- iris[-tr.idx,5]
table(testLabels)
