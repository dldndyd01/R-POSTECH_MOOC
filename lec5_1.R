# 5-1
install.packages("lattice")
library(lattice)

demo(lattice)
help("ethanol")

head(ethanol)
dim(ethanol)
str(ethanol)
hist(ethanol$C)

# 기본 산점도와 동일
xyplot(NOx ~E, data = ethanol)

xyplot(NOx ~ E | C, data = ethanol)
xyplot(NOx~ E| C, data = ethanol, subset = C>8)

# 5-2
library(ggplot2)
car <- read.csv("autompg.csv")
head(car)
str(car)

car1<- subset(car, cyl ==4 | cyl ==6 | cyl ==8)
attach(car1)

car1$cyl <- as.factor(car1$cyl)
ggplot(car1,aes(x = wt, y = disp, color = cyl, shape = cyl)) + geom_point(size = 3)

ggplot(car1, aes(x = wt, y = disp, color = mpg, size = mpg)) + geom_point(alpha = 0.6)

p1<- ggplot(car1, aes(factor(cyl), fill = factor(cyl)))
p1 <- p1+geom_bar()
p1
p1 <-p1 + facet_grid(.~origin)
p1

p <- ggplot(data = car1, aes(factor(cyl)))
p + geom_bar(aes(fill=factor(origin)), colour = "black")

ggplot(car1, aes(x = wt, y = mpg))+geom_point(shape=1) + geom_smooth(method = lm,se = FALSE)   #se = FALSE는 신뢰구간 없이 파란선만 보이게 해줌

# 비선형회기식 표현
ggplot(car1, aes(x = wt, y = mpg))+geom_point(shape=1) + geom_smooth(method = "loess")

# 5-3
library(scatterplot3d)
data(trees)
s3d<- scatterplot3d(trees, type = "h",highlight.3d = TRUE, angle = 55, scale.y = 0.7, pch = 16)

write.csv(trees,file = "trees.csv",row.names = FALSE)

attach(trees)
my.lm <- lm(Volume~Girth + Height)
s3d$plane3d(my.lm,lty.box = "solid")

par(mfrow=c(1,1))
cor.x <- cor(car[,1:6])
heatmap(cor.x , symm = TRUE)
round(cor.x,2)

cor(USArrests)
x <- as.matrix(USArrests[,-3])
result <- heatmap(x, scale = "column", Colv = NA, cexCol = 1)

row.names(USArrests)[result$rowInd[1:10]]
row.names(USArrests)[result$rowInd[35:50]]

# 5-4
install.packages("maps")
library(maps)
install.packages("mapdata")
library(mapdata)
install.packages('mapproj')
library(mapproj)

par(mfrow= c(1,2))
map(database = "world", region = c("South Korea","North Korea"))
title("Korea map in maps packaes")

# 밑에 패키지가 더 상세함
map(database = "worldHires",region = c("South Korea","North Korea"))
title("Korea map in mapdata packages")

map("world","China")
map.cities(country = "China", capitals = 3, minpop = 3500000, maxpop = 5000000)

par(mfrow=c(1,1))
map("worldHires", region = c("South Korea", "North Korea", "Japan", "China"))
map("worldHires", region =c("South Korea"), col = "blue", add= TRUE, fill = TRUE)
map("worldHires", region =c("North Korea"), col = "coral", add= TRUE, fill = TRUE)
map("worldHires", region =c("Japan"), col = "purple", add= TRUE, fill = TRUE)
map("worldHires", region =c("China"), col = "Yellow", add= TRUE, fill = TRUE)

map("worldHires",proj = "azequalarea",orient = c(37.24223, 131.8643,0))
map.grid(col = 2)
points(mapproject(list(y = 37.24223, x = 131.8643)), col = "blue", pch ="x", cex = 2)
title("독도")


sub.usa <-subset
