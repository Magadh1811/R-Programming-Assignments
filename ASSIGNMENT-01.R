#Ql : Vector
#create vector of logical, numeric, complex, string
v_l <- vector( "logical" , 5 )
typeof(v_l)
v_1
v_n <- vector( "numeric" , 5 )
typeof(v_n)
v_2
v_c <- vector( "complex" , 5 )
typeof(v_c)
v_3
v_s <- vector( "character" , 5 )
typeof(v_s)
v_4

#sum, mean, product of vector ignore NA and Nan values
v1 <- c(1,2,3,NA,"red","bomb",2.3,6.3)
v1
v2 <- c(NA,5,6,7,9.8,9)
v2
sum <- v1 + v2
sum
product <- v1 * v2
product
mean(v2)
mean(v2,na.rm = TRUE)

#test whether given vector contain specified element or not
vec <- c(4,5,6,9,8,2,9,3)
vec
v <- is.element(10,vec)
vv <- is.element(9,vec)
v
vv

#count specific elements in vector
vec1 <- c(1,2,3,"red","for",2,6.5,2,TRUE)
vec1
vl <- sum(vec1==2)
vl

#find second highest
vecc <- c(4,5,6,9,8,2,9,3,11)
vecc
l <- length(vecc)
l
s_h <- sort(vecc,partial = l-1)[l-1]
s_h

#find common elements
vec11 <- c("fc","Fc","FC","pUNE","fC")
vec11
vec12 <- c("PUNE","pUNE","puNE","FC","punE")
vec12
vec13 <- intersect(vec11,vec12)
vec13

#concatinate two vectors
vec11 <- c("fc","Fc","FC","fC")
vec11
vec12 <- c("PUNE","pUNE","puNE","punE")
vec12
vec13 <- c(vec11,vec12)
vec13

#count no. of values in a range
vvv <- c(100,256,858,785,452,369,125,524,652)
vvv
c_r <- sum(vvv > 200 & vvv < 800)
c_r

#Q2 : List
#atleast four function to convert double to integer
v <- c(1.3,5.6,55.6)
v
y <- as.integer(v)
y

#concatinate two lists
l1 <- list(1,2,3,4,"gaku",1.3,3.5)
l1
l2 <- list(5,8,9,6,"naruto",5.8,9.6)
l2
l3 <- list(l1,l2)
l3

#count no. of elements
ll <- list("gaku yadav","kakashi patil","naruto gujjar")
ll
lll <- length(ll)
lll

# adding new element in predifined list
fruits <- list("banana","lemon","cherry","berry")
fruits
new_fruits <- append(fruits,"apple",1)
new_fruits

#vector and matrix in list
list14 <- list(c("red","black","blue"),matrix(c(1,3,4,6,7,9),nrow = 2))
list14
x <- list14[0:2]
x

#string,number,vectors,logical in list
list2 <- list("sasuke aggrwal","pikasa yadav",1,2,3,c(1.5,2.3,5.6),TRUE)
list2

#convert list to vector
listy <- list(1,2,3,4,5,6,8,"green")
listy
x = unlist(listy)
x

#create list named s containing sequence of 10 capital letters, starting from 'D'
s <- list(LETTERS[match("D",LETTERS):(match("D",LETTERS)+10)])
s

#extract all values except the third value of the vector of a given list 
liss <- list(1,2,3,4,5,6)
liss
x <- liss[-3]
x

#Q3 : Matrix
#naming to row headers
x <- c(1,2,3)
x
y <- c(4,5,6)
y
z <- c(7,8,9)
z
l <- matrix(c(x,y,z),3,3,byrow = TRUE)
l
rownames(l) <- letters[1:3]
l

#4 x 3 matrix and columns headers
v <- c(1,2,3,4,5,6,7,8,9,10,11,12)
v
B <- matrix(c(v),4,3,byrow = TRUE)
B
rownames(B) <- letters[1:4]
B
colnames(B) <- letters[24:26]
B

#transpose matrix
Bt <- t(B)
Bt

#multiplication of transpose matrix
MT <- Bt * Bt
MT

#2 X 3 add,subs,multi,divi
v1 <- c(1,2,3,4,5,6)
v1
v2 <- c(7,8,9,10,11,12)
v2
m1 <- matrix(c(v1),2,3,byrow = TRUE)
m1
m2 <- matrix(c(v2),2,3,byrow = TRUE)
m2
add = m1 + m2
subs = m1 - m2
multi = m1 * m2
divi = m1 / m2
add
subs
multi
divi

#display max and min row and cols
v1 <- c(1,2,3,4,5,6,23,56,89)
v1
m1 <- matrix(c(v1),3,3,byrow = TRUE)
m1
max <- which(m1 == max(m1), arr.ind = TRUE)
max
min <- which(m1 == min(m1), arr.ind = TRUE)
min

#matrix with same cols but diff rows concatinate
v1 <- c(1,2,3,4,5,6,23,56,89)
v1
v2 <- c(7,8,9,10,11,12)
v2
m1 <- matrix(c(v1),3,3,byrow = TRUE)
m1
m2 <- matrix(c(v2),2,3,byrow = TRUE)
m2
m3 <- matrix(c(m1,m2),4,3,byrow = TRUE)
m3