# Q : 1
f = read.csv("apps.csv",stringsAsFactors = FALSE)
f

h =na.omit(f)

g = sort(h$Rating, decreasing = TRUE)
g

f_sort = unique(g)
ddf = data.frame()
for(i in 1:length(f_sort))
{
  a = h[h$Rating == f_sort[i],]
  ddf = rbind(ddf,a)
}
ddf

count_ddf = data.frame()
for(i in 1:length(f_sort))
{
  count = nrow(h[h$Rating == u_sort[i],])
  temp_df = data.frame(f_sort[i],count)
  count_ddf = rbind(count_ddf,temp_df)
}
count_ddf

cat = unique(h$Category)
cat
for(j in 1:length(cat))
{
  c = h[h$Category == cat[j],]
  print(c)
}

factor(h$Genres) 
# Q : 2
install.packages("rjson")
library("rjson")

l1 = vector(mode = "list", length = 6)

l1[[2]] = c("Magadh","Shameek","Harshit","Sakshi","Samruddhi")
l1[[1]] = c(1,2,3,4,5)
l1[[3]] = c("TY","TY","FY","SY","SY")
l1[[4]] = c("Mumbai","Nashik","Pune","Nagpur","Yeole")
l1[[5]] = c(90,83,87,80,85)
l1[[6]] = c("A","B","A","A","B")

l1

my_file = toJSON(l1)
write(my_file,"Student.json")

json_import = fromJSON(file = "Student.json")

Stud = as.data.frame(json_import)
Stud

colnames(Stud) = c("Roll no.", "Name", "Class", "City", "Percentage", "Grade")
Stud

new_stud = Stud[Stud$Class == "FY" & Stud$Grade == "A",c(1,2,3,6)]
new_stud

# Q : 3
install.packages("xlsx")

product = data.frame(p_id = c(101,102,103,104,105),
                     p_name = c("Coffee","Orange Juice","Bread","Jam","Peanut Butter"),
                     price = c(70,135,30,45,70)
                     )
product
str(product)

library("Xlsx")

write.table(product,file = "Demo", col.names = TRUE)
read.table("Demo")
