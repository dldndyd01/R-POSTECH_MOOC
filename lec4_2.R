par(mfrow=c(1,2))
boxplot(wt,col = c("coral"))
boxplot(wt~sex,col = c("green","orange"))

bar(mfrow=c(1,1))
boxplot(wt~sex, boxwex = 0.5, horizontal = TRUE, col = c("grey","red"))    # boxwex 는 그림상자의 폭을 조정해준다.

par(mfrow = c(1,2))
a<- boxplot(brain$wt~brain$sex,col = c("green","orange"))
text(c(1:nlevels(brain$sex)),a$stats[nrow(a$stats),]+30, paste("n = ",table(brain$sex),sep = ""))

car<-read.csv("autompg.csv")
head(car)

attach(car)
table(car$cyl)
freq_cyl<- table(cyl)
names(freq_cyl) <- c("3cyl","4cyl","5cyl","6cyl","8cyl")
barplot(freq_cyl)
pie(freq_cyl)
pie(freq_cyl, labels = c("3cyl","4cyl","5cyl","6cyl","8cyl"),clockwise = TRUE)

car1 <- subset(car, cyl ==4|cyl ==6 | cyl==8)
table(car1$cyl)
freq1_cyl<- table(car1$cyl)
pie(freq1_cyl, labels = c("4cyl","6cyl","8cyl"),clockwise = TRUE)
