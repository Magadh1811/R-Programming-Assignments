# D A T A   M A N I P U L A T I O N
library(tidyverse)
library(corrplot)
library(tidyr)
library(ggplot2)
library(fmsb)
library(RColorBrewer)
library(stringr)

app = read.csv("apps.csv",stringsAsFactors = FALSE)
app

# 1 : Initial exploration
str(app)

# 2 : Summary of variables
summary(app)

# 3 : Data set dimensions
dim(app)

# 4 : Quick visualization
# Category
cat = unique(app$Category)
cat
count_cat = data.frame()
for(i in 1:length(cat))
{
  count = nrow(app[app$Category == cat[i],])
  temp_df = data.frame(cat[i],count)
  count_cat = rbind(count_cat,temp_df)
}
count_cat

barplot(count_cat$count,
        names.arg = count_cat$cat.i.,
        ylab = "Frequncy", 
        xlab = "Category", 
        main = "Frequncy barplot of Category"
        )

# App Installs
ins = unique(app$Installs)
ins
count_ins = data.frame()
for(i in 1:length(ins))
{
  count = nrow(app[app$Installs == ins[i],])
  temp_df = data.frame(cat[i],count)
  count_ins = rbind(count_ins,temp_df)
}
count_ins

barplot(count_ins$count,
        names.arg = count_ins$ins.i.,
        ylab = "Frequncy", 
        xlab = "no. of Installs", 
        main = "Frequncy barplot of Installs"
        )

# App Type
ty = unique(app$Type)
ty
count_ty = data.frame()
for(i in 1:length(ty))
{
  count = nrow(app[app$Type == ty[i],])
  temp_df = data.frame(ty[i],count)
  count_ty = rbind(count_ty,temp_df)
}
count_ty

barplot(count_ty$count,
        names.arg = count_ty$ty.i.,
        ylab = "Frequncy", 
        xlab = "Type", 
        main = "Frequncy barplot of App Type"
        )

# Content.Rating
Cr = unique(app$Content.Rating)
Cr
count_Cr = data.frame()
for(i in 1:length(Cr))
{
  count = nrow(app[app$Content.Rating == Cr[i],])
  temp_df = data.frame(Cr[i],count)
  count_Cr = rbind(count_Cr,temp_df)
}
count_Cr

barplot(count_Cr$count,
        names.arg = count_Cr$Cr.i.,
        ylab = "Frequncy", 
        xlab = "Content Rating", 
        main = "Frequncy barplot of Content Rating"
        )

# Genres
gn = unique(app$Genres)
gn
count_gn = data.frame()
for(i in 1:length(gn))
{
  count = nrow(app[app$Genres == gn[i],])
  temp_df = data.frame(gn[i],count)
  count_gn = rbind(count_gn,temp_df)
}
count_gn

barplot(count_gn$count,
        names.arg = count_gn$gn.i.,
        ylab = "Frequncy", 
        xlab = "Genres", 
        main = "Frequncy barplot of Genres"
        )

# Android Version
av = unique(app$Android.Ver)
av
count_av = data.frame()
for(i in 1:length(av))
{
  count = nrow(app[app$Android.Ver == av[i],])
  temp_df = data.frame(av[i],count)
  count_av = rbind(count_av,temp_df)
}
count_av

barplot(count_av$count,
        names.arg = count_av$av.i.,
        ylab = "Frequncy", 
        xlab = "Android Version", 
        main = "Frequncy barplot of Android Version"
        )

# 5 : Display missing value for each column
sapply(app, function(x) sum(is.na(x)))

# Removing NA values
app = na.omit(app)
app

# 6 : Display no. of unique values for each column
count_df = data.frame()
for(i in 1:ncol(app))
{
  count = length(unique(app[,i]))
  temp_df = data.frame(colnames(app)[i],count)
  count_df = rbind(count_df,temp_df)
}
count_df

# 7 : Handel Duplicates (if any)
view(duplicated(app))

# 8 : Check types if imp cols and convert it to its appropriate form
price = app$Price
price
str_remove(price,"[[:punct:]]")
price = as.double(str_remove(price,"[$]"))
app[,"Price"] = price
app

# 9 : Check the col content rating and arrange its ordinal form properly
app[app$Content.Rating == "Adults only 18+",2]
app[app$Content.Rating == "Mature 17+",2]

factor(app$Content.Rating,levels = c("Everyone","Everyone 10+","Teen","Mature 17+","Adults only 18+","Unrated"))

# 10 : Observe outlying values if any in any of the cols
# Rating
boxplot(app$Rating,
        main = "Boxplot of Rating of each app"
       )

# Size
boxplot(app$Size,
        main = "Boxplot of Size of each app"
       )

# 11 : Prepare box plot of game, Family and Medial category
app_game = app[app$Category == "GAME"]
app_family = app[app$Category == "FAMILY"]
app_medical = app[app$Category == "MEDICAL"]

boxplot(app_game$Rating)
boxplot(app_family$Rating)
boxplot(app_medical$Rating)

# 12 : Prepare Donut chart for Google play apps android version ratio(if possible)
#not possible
