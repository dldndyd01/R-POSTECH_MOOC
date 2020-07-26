install.packages("readxl")
library(readxl)
mtcars1 <- read_excel("mtcarsb.xlsx",sheet = "mtcars")
head(mtcars1)

brain1 <- read_excel("mtcarsb.xlsx",sheet = "brain")
head(brain1)
brainm<- read_excel("mtcarsb.xlsx",sheet=2)
head(brainm)

install.packages("foreign")
library(foreign)

install.packages("sas7bdat")
library(sas7bdat)

b1<- read.sas7bdat("brain.sas7bdat")
head(b1)

install.packages("RODBC")
library(RODBC)
