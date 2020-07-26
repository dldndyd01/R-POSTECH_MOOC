brain <- read.csv("brain2210.csv")
head(brain)
dim(brain)

car <- read.table(file = "autompg.txt", na = " ", header = TRUE)

# frequency를 알고싶은경우
table(brain$sex)

# attach 한번하면 brain$sex 이런식으로 안적어도됨
attach(brain)
# detach(brain)
table(sex)
hist(wt)

