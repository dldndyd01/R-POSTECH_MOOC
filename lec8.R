# 8-1 »ó°üºÐ¼®

car <- read.csv("autompg.csv")
car1<-subset(car, cyl==4|cyl ==6 | cyl==8)
attach(car1)
detach(car1)
cor(wt,mpg)
cor(disp,mpg)
cor(accler, mpg)

var1<-c("disp","wt","accler","mpg")
pairs(car1[var1],main = "Autompg", cex = 1, col = as.integer(car1$cyl),pch = substring((car1$cyl),1,1))


monkey<-read.csv("monkey.csv")
attach(monkey)
cor(height,weight)

monkey1<-read.csv("monkey_k.csv")
attach(monkey1)
cor(height, weight)

plot(height, weight)
abline(lm(weight~height),col ="red",lwd = 4,lty = 5)
m2<-lm(weight~height)
summary(m2)

# 8-2 È¸±ÍºÐ¼®

head(car)
par(mfrow = c(1,1))
# ´Ü¼ø È¸±Í¸ðÇü

r1 <- lm(mpg~wt, data = car1)
summary(r1)
anova(r1)

plot(wt,mpg,col = as.integer(car$cyl), pch =19)
abline(lm(mpg~wt),col = "red", lwd = 2)


r2<- lm(mpg~disp, data=car1)
summary(r2)
anova(r2)

layout(matrix(c(1,2,3,4),2,2))
plot(r2)

r3<- lm(mpg~wt + accler , data = car1)
summary(r3)
anova(r3)
pairs(car[,1:6],cex = 1, col = as.integer(car$cyl))

# 8-3
# ÅØ½ºÆ® ¸¶ÀÌ´× 1
install.packages("NLP")
library(NLP)
install.packages("tm")
library(tm)
library(wordcloud)
install.packages("twitteR")
library(twitteR)
install.packages("RColorBrewer")
library(RColorBrewer)

data(crude)
crude<-tm_map(crude, removePunctuation)
crude<- tm_map(crude, removeNumbers)
crude<- tm_map(crude, function(x) removeWords(x, stopwords()))
stopwords()

tdm <- TermDocumentMatrix(crude)
m<-as.matrix(tdm)
v<- sort(rowSums(m), decreasing = TRUE)
d <- data.frame(word = names(v), freq = v)

wordcloud(d$word, d$freq, random.order=FALSE)

# 8-4 ÅØ½ºÆ®¸¶ÀÌ´×2
# lec8_4.R
# Install package NLP, tm, wordcloud

# set working directory
setwd("D:/tempstore/moocr")

# Natural language processing
#install.packages('NLP')
# text mining package
#install.packages('tm')
# visualizing
#install.packages('wordcloud')
# color displaying
#install.packages('RColorBrewer')

# set library (set in order)
library(NLP)
library(tm)
library(RColorBrewer)
library(wordcloud)

# 20 new articles from Reuter- 21578 data set
data(crude)
# To know abour crude data
help(crude)

# information about the first file in crude data
str(crude[[1]])
content(crude[[1]])
meta(crude[[1]])
lapply(crude, content)

# inspect function
inspect(crude[1:3]) 
inspect(crude[[1]]) 

# 1. remove punctuation in documnet
crude<-tm_map(crude, removePunctuation)
content(crude[[1]])

# 2. remove numbers
crude<-tm_map(crude, removeNumbers)
content(crude[[1]])

# 3. remove stopwords
crude<-tm_map(crude, function(x) removeWords(x,stopwords()))
content(crude[[1]])

stopwords()

# 4. contruct term-doucument matrix 
tdm<-TermDocumentMatrix(crude)
inspect(tdm)

#inspect(tdm[ , c("127", "144", "191", "194")])
#inspect(tdm[c("price", "prices", "texas"), c("127", "144", "191", "194")])

# 5. read tdm as a matrix
m<-as.matrix(tdm)
head(m)
# 6. sorting in high frequency to low frequency 
v<-sort(rowSums(m), decreasing=TRUE)
v[1:10]
# 7. match with freq and word names
d<-data.frame(word=names(v), freq=v)
head(d)
d[957:962, ]

# 7. plot a word cloud
# wordcloud(d$word, d$freq)
help(wordcloud)

# 7-1. Now lets try it with frequent words plotted first
wordcloud(d$word,d$freq,c(8,.5),2,,FALSE,.1)

# 7-2. color plot with frequent words plotted first
pal <- brewer.pal(9,"BuGn")
pal <- pal[-(1:4)]
wordcloud(d$word,d$freq,c(8,.3),2,,FALSE,,.15,pal)

# 9. Korean text #####
# takes quite long for installing
install.packages("KoNLP")
library(KoNLP)
# Korean dictionary
useSejongDic (backup=T)

# 10. example data in tm pacakge: how it is declared
tm.dir <- system.file ("texts", "txt", package = "tm")
tm.dir
#C:/Users/hyeseon/Documents/R/win-library/3.4/tm/texts/txt"
dir (tm.dir)
#[1] "ovid_1.txt" "ovid_2.txt" "ovid_3.txt" "ovid_4.txt" "ovid_5.txt"

plans <- VCorpus ( DirSource (tm.dir,pattern="txt8"))

input <- list.files (tm.dir, pattern="txt", full.names=T)
conv <- paste0 ("iconv -f CP949 -t utf-8 ", input, " > ", input, "6")
for(i in conv) system (i)



URL <- "https://ko.wikipedia.org/wiki/"
keywords <- c (" ºò _ µ¥ÀÌÅÍ "," µ¥ÀÌÅÍ _ ¸¶ÀÌ´× ", " ÀÎ°øÁö´É ", " µö _ ·¯´× ")
urls <- paste0 (URL, keywords)
urls <- iconv (urls, "CP949", "UTF-8") # Windows
urls <- unlist ( lapply (urls, URLencode))
o1 <- URISource (urls, encoding="UTF-8", mode="text")
c1 <- VCorpus(o1)
inspect (c1)
c2 <- tm_map (c1, function(x) gsub (pattern="<[^>]*>", replacement=" ", x))
c2 <- tm_map (c1, tolower)
c2 <- tm_map (c2, removePunctuation)
c2 <- tm_map (c2, removeNumbers)
c2<- tm_map (c2, removeWords, stopwords ("english"))
inspect (c2)

file1<-"stattext.txt"

Dir <- "stattext.txt"


