brain<- read.csv("brain2210.csv")
View(brain)
detach(brain)
attach(brain)

# subset(������ȭ�ҳ�(brain), ����(sex�� f����))
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



# ���� �����Ϸ� ������׷� �����ָ� ���̸� ���� ����
hist(brainf$wt, breaks= 12, col = "green",cex = 0.7,main="Histogram (Female)", xlab=  "brain weight", xlim=c(900,1700),ylim=c(0,25))
hist(brainm$wt, breaks = 12, col = "orange", main = "histogram with (Male)", xlab = "brain weight", xlim=c(900,1700),ylim=c(0,25))hist(brainf$wt, breaks= 12, col = "green",cex = 0.7,main="Histogram (Female)", xlab=  "brain weight")



# csv���� ��������
write.table(brainf,file = "brainf.csv",row.names = FALSE, sep =",",na = " ")
# txt�� ��������
write.table(brainm, file = "brain.txt", row.names =FALSE, na = " ")
  