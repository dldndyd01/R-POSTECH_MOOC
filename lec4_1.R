brain<- read.csv(file = "brain2210.csv")
head(brain)

attach(brain)
hist(wt)
hist(wt,col = "lightblue")

hist(wt,breaks = 10, col = "slateblue2", main = "Histogram of Brain weight")

# 657°¡Áö »ö
colors()

grep("violet",colors(), value= TRUE)

par(mfrow = c(1,1))
d <- density(wt)
plot(d)

par(mfrow = c(2,1))
brainf<- subset(brain, brain$sex =="f")
hist(brainf$wt, breaks = 12, col = "green", xlim = c(900,1700), ylim = c(0,20))

brainm <- subset(brain,brain$sex == "m")
hist(brainm$wt, breaks = 12, col = "orange", xlim = c(900,1700), ylim = c(0,20))
