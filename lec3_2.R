brain<- read.csv("brain2210.csv")
View(brain)
detach(brain)
attach(brain)

# subset(데이터화할놈(brain), 조건(sex는 f만만))
brainf<-subset(brain,sex =="f")
brainf
mean(brainf$wt)
brain1300 <- subset(brain, brain$wt<1300)
summary(brain1300)
table(sex)

brainf<-subset(brain,sex == "f")
mean(brainf$wt)
sd(brainf$wt)

brainm<- subset(brain,sex == "m")
mean(brainm$wt)
sd(brainm$wt)

aggregate(wt~sex, data=brain, FUN = mean)
aggregate(wt~sex, data=brain, FUN = sd)

par(mfrow = c(2,2))
brainf<-subset(brain,brain$sex == "f")
hist(brainf$wt, breaks= 12, col = "green",cex = 0.7,main="Histogram (Female)", xlab=  "brain weight")

brainm <- subset(brain, brain$sex == "m")
hist(brainm$wt, breaks = 12, col = "orange", main = "histogram with (Male)", xlab = "brain weight")



# 같은 스케일로 히스토그램 보여주면 차이를 보기 편해
hist(brainf$wt, breaks= 12, col = "green",cex = 0.7,main="Histogram (Female)", xlab=  "brain weight", xlim=c(900,1700),ylim=c(0,25))
hist(brainm$wt, breaks = 12, col = "orange", main = "histogram with (Male)", xlab = "brain weight", xlim=c(900,1700),ylim=c(0,25))hist(brainf$wt, breaks= 12, col = "green",cex = 0.7,main="Histogram (Female)", xlab=  "brain weight")



# csv파일 내보내기
write.table(brainf,file = "brainf.csv",row.names = FALSE, sep =",",na = " ")
# txt로 내보내기
write.table(brainm, file = "brain.txt", row.names =FALSE, na = " ")
  