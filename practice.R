brain <- read.csv("brain2210.csv")
library(dplyr)
summary <- brain %>% 
  filter(wt<1000)
table(summary$sex)
