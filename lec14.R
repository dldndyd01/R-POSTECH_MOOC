# 14-1

# install.packages("arules")
library(arules)

dvd1<- read.csv("dvdtrans.csv")
dvd1
dvd.list<- split(dvd1$Item, dvd1$ID)
dvd.list
dvd.trans<-as(dvd.list, "transactions")
dvd.trans

inspect(dvd.trans)

summary(dvd.trans)

dvd_rule<-apriori(dvd.trans, parameter = list(support = 0.2,
                                              confidence = 0.20,
                                              minlen = 2))
dvd_rule

inspect(dvd_rule)

itemFrequencyPlot(dvd.trans,support= 0.2, main = "item for support >0.2", col = "green")

# 14-2

data("Groceries")
Groceries <- Groceries
summary(Groceries)

itemFrequencyPlot(Groceries,support = 0.05, main = "items for support >= 5%",col = "green")
itemFrequencyPlot(Groceries,topN = 20, main = "Support top 20 items",col = "coral")

Grocery_rule <- apriori(data = Groceries, parameter = list( sup=0.04, conf=0.2, minlen=2))

summary(Grocery_rule)
inspect(Grocery_rule)

inspect(sort(Grocery_rule, by="lift"))

rule_interest <- subset(Grocery_rule, items %in% c("yogurt","rolls/buns"))
inspect(rule_interest)
summary(rule_interest)

  Grocery_rule_df <- as(Grocery_rule, "data.frame")
Grocery_rule_df
write(Grocery_rule, file = "Grocery_rule.csv",
      sep = ",",
      quote = TRUE,
      row.names = FALSE)

# 14-3
re <- read.csv("remiss.csv")
t1<- glm(remiss~cell + smear+infil+li+blast+temp, data= re, family = binomial(logit))
summary(t1)      # pValue¸¦ ºÁ¼± infil°ú blast´Â »©¾ß°Ú±º!
cor(re)

t2 <- glm(remiss~cell+smear+li+temp , data = re, family = binomial(logit))
summary(t2)

t3 <- glm(remiss~cell+li+temp, data= re, family = binomial(logit))
summary(t3)

