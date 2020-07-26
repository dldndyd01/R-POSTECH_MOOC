# 함수만들기
square <- function(x){return(x*x)}
square(9)
square(1:3)

dif <-function(x,y){return(x-y)}
dif(20,10)

rootdif<- function(x,y){
  return(sqrt(x-y))
}
rootdif(20,10)

round(5.14846)
round(5.148424,2)

round(rootdif(20,10))
round(rootdif(20,10),2)

for(i in 1:10){
  if(i%%3 == 1){
    next()
  }
  print(i)
}

for (i in 1:10){
  i <- i+1
  print(i)
  if(i>5){
    #stop loop after i>5
    break
  }
}

y = 0
while(y <5){
  print(y <-y+1)
}
