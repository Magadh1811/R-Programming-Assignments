# D A T A  F R A M E
#Q1 : create, summary, dimensions of data farme
df <- data.frame (
  product_id = c("p101","p102","p103","p104","p105","p106"),
  product_name = c("livo","limo","lico","lino","lizo","liro"),
  price = c(75,56,48,23,55,48),
  expiry_date_month = c(11,12,11,12,02,05),
  expiry_date_year = c(2024,2022,2021,2023,2021,2023)
)
df

summary(df)
dim(df)

#Q2 : add new col(product_size) and add 4 more record
New_col_df <- cbind(df, product_size= c("10ml", "20ml", "30ml","40ml","50ml","60ml"))
New_col_df

New_row_df <- rbind(New_col_df, c("p107", "libo", 90,10,2024,"70ml"),
                    c("p108", "lido", 89,07,2022,"80ml"),
                    c("p109", "lijo", 56,04,2023,"90ml"),
                    c("p1010", "lilo", 49,07,2021,"100ml"))
New_row_df

#Q3 : extract product_name and price, month = ___, price>__, year>__
New_row_df["product_name"]
New_row_df["price"]
df_new1 <- New_row_df[ which(New_row_df$price > 65),]
df_new1
df_new2 <- New_row_df[ which(New_row_df$expiry_date_month == 12),]
df_new2
df_new3 <- New_row_df[ which(New_row_df$expiry_date_year > 2022),]
df_new3

#Q4 : create emp and dept dataframe 
emp <- data.frame (
  emp_id = c("ed111","ed112","ed113","ed114","ed115","ed116","ed117","ed118","ed119","ed120"),
  emp_name = c("Harshit","Magadh","Ali","Rohan","Jay","Shameek","Yash","Harsh","Rohit","Bhushan")
)
dept <- data.frame (
  dept_id = c("d01","d02","d03","d04","d05","d06","d07","d08","d09","d10"),
  dept_name = c("CS","CA","Maths","CS","Maths","CA","Maths","CA","CS","Maths")
)
emp
dept
summary(emp)
summary(dept)
dim(emp)
dim(dept)

EMP_DETAILS <- cbind(emp, dept)
EMP_DETAILS

EMPDETAILS <- cbind(EMP_DETAILS, Salary= c(35000,25000,23000,15000,19000,27000,37000,40000,26000,41000))
EMPDETAILS

#Q5 : extract CS dept and extract empid & empname where salary>34000 & belong to maths dept
dff1 <- EMPDETAILS[ which(EMPDETAILS$dept_name == "CS"),]
dff1
dff2 = EMPDETAILS[ which(EMPDETAILS$Salary > 34000 & EMPDETAILS$dept_name == "Maths"),]
dff2

# F A C T O R S
#Q6 : create ordered factor from of names of months
mon_uno <- c("March","April","January","November","January","September","October","September",
             "November","August","February","January","November","November","February","May",
             "August","February","July","December","August","August","September","November",
             "September","February","April")

mon_uno
mon_or = factor(mon_uno)
mon_or
print(table(mon_or))

#Q7 : create vector for emp designation and convert to factor
emp_desig <- c("Asst.manager","manager","team member","manager","team member",
               "Asst.manager","team member","Asst.manager","manager")
emp_desig
emp_desig_new = factor(emp_desig)
emp_desig_new

#Q8 : use iris data set in R
data("iris")
# Display level wise table of Species
df = as.data.frame(iris)
df
dim(df)
summary(df)
str(df)
df1 <- factor(df$Species,levels = c('versicolor','setosa','virginica'))
df1
