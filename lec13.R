# 13-1
m1 <- matrix(
  c(150,50,130,55,80,80,100,85,95,91),
  nrow = 5,
  ncol = 2,
  byrow = TRUE)

m1
m1 <- as.data.frame(m1)

p1 <- dist(m1)
p1

D2 <- dist(m1, method="minkowski",p =3) # p=3 ·Î ÇØÁà¾ßµÅ
D2
D3 <- dist(m1, method = "manhattan",p=4)
D3
m2 <- matrix(
  c(20,6,14,30,7,15,46,4,2),
  nrow = 3, ncol = 3, byrow = TRUE,
  dimnames = list(
    c("obs1","obs2","obs3"),
    c("age","exp","time")))
m2

cor(m2[1,],m2[2,])
cor(m2[1,],m2[3,])


# 13-2
# install.packages("DAAG")
library(lattice)
library(DAAG)

data("wages1833")
head(wages1833,10)
dat1<- wages1833
dat1<- na.omit(dat1)
str(dat1)

dist_data <- dist(dat1)

hc_a <- hclust(dist_data, method = "complete")
plot(hc_a, hang = -1, cex = 0.7, main = "complete")

hc_b <- hclust(dist_data, method = "average")
plot(hc_b, hang = -1, cex = 0.8, main = "average")

hc_c <- hclust(dist_data, method = "ward.D2")
plot(hc_c, hang = -1, cex = 0.7, main = "ward's method")

# 13-3
dat1 <-wages1833
dat1<-na.omit(dat1)

# install.packages("factoextra")
library(factoextra)
fviz_nbclust(dat1,kmeans,method = "wss")

km <- kmeans(dat1, 3, nstart =25)   # k = 3
km
fviz_cluster(km,data = dat1, ellipse.type = "convex", repel = TRUE)

library("cluster")
pam_out <- pam(dat1,3)
pam_out

fviz_cluster(pam_out, data = dat1, ellipse.type = "convex", repel = TRUE)
