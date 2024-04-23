#PDF 1
#Q : 01 : String manipulation
install.packages("tidyverse")
library(tidyverse)
s1 = "Welcome to or 0"
s2 = "Fergusson!"
s3 = "Fergusson!"

str_replace(s1,s1,s2)
gsub("e","",s1)
str_remove(s1,"[[:punct:]]")
gsub(" ","",s1)
str_c(s1," ",s2)
identical(s3,s2)
str_to_sentence(s1)

#Q : 02 : use dplyr package 
EMPDETAILS <- data.frame (
  emp_id = c("ed111","nan","ed113","ed114","ed115","ed116","ed117","ed118","ed119","ed120"),
  emp_name = c("Harshit","Magadh","Ali","Rohan","nan","Shameek","Yash","Harsh","Rohit","Bhushan"),
  dept_id = c("d01","d02","d03","d04","nan","d06","d07","d08","d09","d10"),
  dept_name = c("CS","CA","Maths","CS","Maths","CA","Maths","CA","CS","Maths"),
  Salary= c(35000,25000,23000,15000,NA,27000,37000,40000,26000,41000)
)
EMPDETAILS
install.packages("dplyr")
install.packages("tidyr")
library(dplyr)
library(tidyr)
#Replace string with another string on all columns
EMPDETAILS[EMPDETAILS=="nan"] <- "no value"
EMPDETAILS

#Update on selected columns
EMPDETAILS <- EMPDETAILS %>% 
  mutate(dept_name = str_replace(dept_name, "Maths", "AL"))
EMPDETAILS

#Update on  all numeric columns
EMPDETAILS <- EMPDETAILS %>%
  mutate_if(is.numeric, ~replace_na(.,0))
EMPDETAILS

#Update on selected column index position
x <- EMPDETAILS %>% select(c(1,3))
x
x[x=="no value"] <- "--"
x

#Q : 03 : use apply function
data = data.frame(name=c("Amit","Manjit","Ragini","Kimaya","Sam","Eeshan","Bobby"),
                  age=c(24,22,21,23,20,24,21),
                  gender=c("M","M","F","F","M","M","F"),
                  salary = c(-23000,56000,45000,78000,43000,89000,76000))
data
                                      
#1
sapply(as.data.frame(data[data$gender=="M","age"]),min)
sapply(as.data.frame(data[data$gender=="M","age"]),min)

#2
data[data$age==sapply(as.data.frame(data[,"age"]),max),"name"]

#3
as.vector(sapply(as.data.frame(data[,"salary"]),sum))

#PDF 2
install.packages("stringr")
library(stringr)

addresses <- c("14 Pine Street, Los Angeles", "152 Redwood Street, Seattle", "8 Washington Boulevard, New York")

products <- c("TV" , "laptop", "portable charger", "Wireless Keybord","HeadPhones")

long_sentences <- stringr::sentences[1:10]

field_names <- c("order_number", "order_date", "customer_email", "product_title", "amount")

employee_skills <- c("John Bale (Beginner)", "Rita Murphy (Pro)", "Chris White (Pro)", "Sarah Reid (Medium)")

#1 : Normalize the addresses vector by replacing capitalized letters with lower-case ones.
str_to_lower(string = addresses)

#2 : Pull only the numeric part of the addresses vector.
str_extract(string = addresses, pattern = "[:digit:]+")

#3 : Split the addresses vector into two parts: address and city. The result should be a list.
str_split(string = addresses, pattern = ", ", simplify = T)

#4 : Split the addresses vector into three parts: house number, street and city. The result should be a list.
str_split(string = addresses, pattern = "(?<=[:digit:]) |, ", simplify = T)

#5 : Show only the first 20 characters of all sentences in the long_sentences vector. To indicate that you 
#    removed some characters, use two consecutive periods at the end of each sentence.
str_trunc(string = long_sentences, width = 22, ellipsis = "..")

#6 : Normalize the products vector by removing all unnecessary whitespaces (both from the start, the end 
#    and the middle), and by capitalizing all letters.
str_to_upper(string = str_squish(string = products))
