# 6-1
dat1 <- read.csv(file = "data1.csv")
dat2 <- read.csv(file = "data2.csv")

dat12 <- merge(dat1,dat2,by="ID")

dat3 <- read.csv(file= "data3.csv")

dat123 <- rbind(dat12,dat3)
head(dat123)
library(dplyr)
dat123 %>% 
  filter(alcohol =="yes")

dats1 <- dat12[order(dat12$age),]
dats1
dats2 <-dat12[order(dat12$gender, dat12$age),]
dats2

newdat <- subset(dat12, dat12$gender=="F" & dat12$age>15)
newdat

exdat <- dat12[!names(dat12) %in% c("age","gender")]
exdat

# 6-2
stud <- read.csv("stud_math.csv")
head(stud)
attach(stud)

summary(stud)
mean(G3)
sd(G3)

vars<-c("G1","G2","G3")
head(stud[vars])
summary(stud[vars])

install.packages("psych")
library(psych)
describe(stud[vars])
sapply(stud[vars],mean)

table(health)
health_freq<-table(health)
names(health_freq) <- c("very bad", "bad", "average", "good", "very good")
barplot(health_freq,col =6)

table(health, studytime)

# 6-3
par(mfrow= c(2,2))
hist(G1, Breaks = 10, col  = "lightblue")
hist(G2, breaks = 10, col = "green")
hist(G3, breaks = 10, col = "coral")

par(mfrow = c(1,2))
boxplot(G3~address, boxwex = 0.5, col = c("yellow" ,"coral"),main ="G3 by urban, rural")
boxplot(G3 ~ traveltime, boxwex = 0.5, col = c("red", "orange", "yellow", "green"), main = "G3 by traverltime")

boxplot(G3~freetime, boxwex = 0.5, col = c(1,2,3,4,5))
boxplot(G3~studytime,boxwex = 0.5, col = c(10,11,12,13) )


library(lattice)
xyplot(G3~traveltime | sex , data = stud, pch = 16, main = "G3 ~ traveltime | sex")

s1 <- subset(stud, G3 ==0)
View(s1)
library(ggplot2)
ggplot(stud, aes(x = G1, y = G3, color = sex, shape = sex)) + geom_point(size = 2)

ggplot(data = stud, aes(factor(romantic))) + geom_bar(aes(fill = factor(sex)))

ggplot(data = stud, aes(factor(internet))) + geom_bar(aes(fill =(factor(address))))


vars1 <- c("G1","G2","G3")
pairs(stud[vars1], main = "Student Math Data", pch =21, bg = c("red","green3")[unclass(stud$sex)])
View(stud)

boxplot(G3~health,boxwex = 0.5)

# 6-4
# qqsline은 1사분위와 3사분위를 직선으로 그은 것
par(mfrow = c(2,2))
qqnorm
qqline(G1, col = 2, cex = 7)

qqnorm(G2)
qqline(G2, col = 2, cex = 7)

qqnorm(G3)
qqline(G3, col = 2, cex = 7)

# 정규분포 적합성검정
shapiro.test(G3) # p value가 0에 가까우므로 정규분포한다고 볼 수 없다.

install.packages("nortest")
library(nortest)
ad.test(G3)

runif(5, min=1 , max = 5)
rnorm(5, mean = 5, sd = 1)
rgamma(5, shape = 3, rate = 2)
rbinom(5, size = 100, prob = 0.2)


x<- rnorm(1000)
plot(density(x), xlim = c(-5, 10))

nreps <- 100
ll <- numeric(nreps)
ul <- numeric

set.seed(10) 
rnorm(1000) 
mean(rnorm(1000))

