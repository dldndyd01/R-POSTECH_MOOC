# ���� �̸��ֱ�
gender <-c(0,1)
names(gender) <- c("female", "male")
gender

# ���������� factor���
# �л갰���� ����Ҷ� factor�� ����ؾ� �ϴ� ��� ����
size <-  c("S","M","L","XL")
size_factor <- factor(size)
size_factor  # ���ĺ������� ���÷��� ����

is.factor(size_factor)

size_factor3 <- factor(size, ordered = TRUE,
                       levels = c("S","M","L","XL"))
size_factor3

# ��� �̸��ֱ�
x<- matrix(rnorm(12),nrow = 4)
x
dim(x)
dimnames(x)[[2]] <- paste("x",1:3,sep = "") # ���� �̸��ֱ�
dimnames(x)[[1]] <- paste("id",1:4,sep= "") # �࿡ �̸��ֱ�
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