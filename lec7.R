# 7-1
stud <- read.csv("stud_math.csv")

attach(stud)



t.test(G3, mu = 10)

# �� ���� ǥ����� �� ������
t.test(G3~address, data = stud)

# ��������
t.test(G3~address, data= stud, alternative = c("less"))

par(mfrow = c(1,1))
t.test(G3~ activities, data = stud)
boxplot(G3~activities, boxwex = 0.5, col = c(5, 19))

# ������ ���
# �ô��(��������, ������ �� �ְ����� ��ġ)
wilcox.test(G3~address)



t.test(G3~internet, data=stud) 

# 7-2
# ¦�� �̷� �׷찣 �� paired t-test

bp <- read.csv("bp.csv")
attach(bp)
t.test(bp_pre, bp_post, mu = 0, paired = T)

t.test(bp_pre, bp_post, mu = 0 , alternative = "greater", paired =T)



# 7-3
diet <- read.csv("weight.csv")
attach(diet)
t.test(wt_pre,wt_post, mu = 0, paired =T)


a1<- aov(G3~address)
summary(a1)
round(tapply(G3, address, mean),2)

traveltime<-as.factor(traveltime)
a2 <- aov(G3~traveltime)
summary(a2)


# ���İ���
TukeyHSD(a2, "traveltime", ordered = TRUE)
plot(TukeyHSD(a2, "traveltime"))


a4 <- aov(G3~romantic)
summary(a4)

boxplot(G3~romantic, boxwex = 0.5,col = c("coral","orange"))

studytime<-as.factor(studytime)
aa <- aov(G3~studytime)
summary(aa)
tapply(G3, studytime, mean)

# 7-4
dat<- read.csv("chol_ex.csv")
head(dat)
dim(dat)

attach(dat)
a6<- aov(value~ drug+age)
summary(a6)

a7 <- aov(value ~ drug+age+drug*age)
summary(a7)

par(mfrow = c(1,2))
boxplot(value~drug, boxwex = 0.7)
boxplot(value~age, boxwex = 0.7)

round(tapply(value, drug, mean),2)
round(tapply(value, age, mean),2)

interaction.plot(drug,age,value)
interaction.plot(age,drug,value)

a2 <- aov(G3~studytime+sex)

summary(a2)
boxplot(G3~sex, boxwex = 0.5, col = c("yellow", "coral"))

