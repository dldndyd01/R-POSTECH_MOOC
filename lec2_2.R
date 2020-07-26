# 벡터 이름주기
gender <-c(0,1)
names(gender) <- c("female", "male")
gender

# 범주형변수 factor사용
# 분산같은거 계산할때 factor로 계산해야 하는 경우 생김
size <-  c("S","M","L","XL")
size_factor <- factor(size)
size_factor  # 알파벳순서로 디스플레이 해줌

is.factor(size_factor)

size_factor3 <- factor(size, ordered = TRUE,
                       levels = c("S","M","L","XL"))
size_factor3

# 행렬 이름주기
x<- matrix(rnorm(12),nrow = 4)
x
dim(x)
dimnames(x)[[2]] <- paste("x",1:3,sep = "") # 열에 이름주기
dimnames(x)[[1]] <- paste("id",1:4,sep= "") # 행에 이름주기
x

y <- matrix(rnorm(12),nrow = 4)
colnames(y) <- c("y1","y2","y3")
y

is.data.frame(x)
x<- as.data.frame(x)
is.data.frame(x)

x$x1
mean(x$x1)
sd(x$x1)
summary(x)
