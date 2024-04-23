# Q : 01 : Use print(), nchar() & paste()
iris
for(i in names(iris))
{
  print(paste0(i, " (",nchar(i), ")"))
}

# Q : 02 : Write while loop and use rnorm()
n=0
while(n<=1)
{
  n=rnorm(1)
  print(n)
}

# Q : 03 : use time argument that defaults to lubridate::now()
greet <- function(time = lubridate::now())
{
  h <- lubridate::hour(time)
  if(h>=5 && h<12)
  {
    print("Good Morning")
  }else
  {
    if(h>=12 && h<16)
    {
      print("Good Aftenoon")
    }else
    {
      print("Good Evening")
    }
  }
}
greet()

# Q : 04 : use placeholder
f=function(a,b,...)
{
  data.frame(a,b,...)
}
A=c(1,2,3)
B=c(TRUE,TRUE,FALSE)
C=c("Tom","Ted","Hank")
D=c(31,32,33)
f(A,B,C,D)

# Q : 05 : write a function and output : 40 pieces of Rs 80 per unit
invoice=function(pcs,unitprice)
{
  net_price=pcs*unitprice
  if(pcs>25)
  {
    net_price=net_price-(net_price*0.1)
    net_price
  }else
  {
    net_price
  }
}
invoice(40,100)