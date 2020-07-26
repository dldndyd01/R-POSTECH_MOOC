car<- read.table(file = "autompg.txt",na = " ", header = TRUE)
head(car)
dim(car)

head(car)
dim(car)
str(car)
summary(car)

attach(car)
table(origin)

apply(car[ ,1:6],2,mean)

freq_cyl <- table(cyl)
names(freq_cyl) <- c("3cyl","4cyl","5cyl","6cyl","8cyl")
barplot(freq_cyl)
barplot(freq_cyl,main = "Cylinders Distribution")

hist(mpg, main = "Mile per gallon: 1970 - 1982",col = "lightblue")

library(scatterplot3d)
scatterplot3d(wt, hp, mpg, type = "h", highlight.3d = TRUE, angle = 55, scale.y = 0.7 , pch = 16, main = "3d~~")

lapply(car[ , 1:6], mean)
a1 <- lapply(car[ , 1:6], mean)
a2 <-lapply(car[ , 1:6], sd)
a3<-lapply(car[ , 1:6], min)
a4<-lapply(car[ , 1:6], max)
table <- cbind(a1,a2,a3,a4)
colnames(table) <- c("mean","sd","min","max")
table
