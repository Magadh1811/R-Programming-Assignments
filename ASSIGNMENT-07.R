install.packages("corrplot")
install.packages("tidyverse")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("RColorBrewer")
install.packages("fmsb")

library(tidyverse)
library(corrplot)
library(tidyr)
library(ggplot2)
library(fmsb)
library(RColorBrewer)

# Q : 1
m <- mtcars[,c(1,3,4,5,6,7)]
head(m)

# Correlogram 
Mat<-cor(mtcars)
head(round(Mat,2))

corrplot(Mat, type = "lower")

# Heatmap
df = as.matrix(mtcars)
heatmap(df, 
        scale = "column"
        )
heatmap(df, 
        Colv = NA, 
        Rowv = NA, 
        scale = "column", 
        col = terrain.colors(256)
        )

# Q : 2
student = c("Harsh","Harshit","Shameek","Sakshi","Ali")
DBMS = c(75,55,66,81,71)
DS = c(88,96,78,82,75)
PS = c(75,80,85,90,95)
AL = c(89,95,83,79,76)

stdf = data.frame(DBMS,DS,PS,AL)
rownames(stdf) = student
stdf

stdf = rbind(max = c(100,100,100,100),min = c(0,0,0,0),stdf)
stdf

par(mfrow = c(2,3))
for(i in 1:length(student))
{
  radarchart(as.data.frame(stdf[c(1,2,i+2),]),
             pcol = rgb(0.7,0.5,0.1,0.4),
             pfcol = rgb(0.7,0.5,0.1,0.4),
             plwd = 4,
             cglcol = 1,
             cglty = 1,
             axislabcol = "Black",
             caxislabes = c(0,100,25),
             vlcex = 2,
             title =student[i],
             axistype = 1
             )
}

# Q : 3
f = read.csv("apps.csv",stringsAsFactors = FALSE)
f
h =na.omit(f)
h

cat = unique(h$Category)
cat

g_sort = data.frame()
g_sort
for(j in 1:length(cat))
{
  c = sapply(h[h$Category == cat[j],c(4,6)],mean)
  g_sort = rbind(g_sort,c)
}
g_sort
rownames(g_sort) <- cat
colnames(g_sort) <- c("Rating","Reviews","Size")
g_sort

tt = t(g_sort)

ddff = as.matrix(tt)
ddff


# Area plot
Rating  = f$Rating
Rating
Size = f$Size
Size
Category = f$Category
Category

data <- data.frame(Rating,Size,Category)
data

#FOR NORMAL AREA PLOT
ggplot(data, 
       aes(x = Rating, 
           y = Size, 
           fill = Category, 
           group = Category
           )
      ) + geom_area()

#FOR STACKED AREA PLOT
ggplot(data, 
       aes(x = Rating, 
           y = Size, 
           fill = Category, 
           group = Category
           )
      ) + geom_area(position = "fill")

# Heatmap
heatmap(ddff,
        scale = "column"
        )
heatmap(ddff,
        Colv = NA, 
        Rowv = NA, 
        scale = "column", 
        col = terrain.colors(256)
        )

# Radar plot
colors_border = c(rgb(0.2,0.5,0.5,0.9),rgb(0.8,0.2,0.5,0.9),rgb(0.7,0.5,0.1,0.9))
colors_in = c(rgb(0.2,0.5,0.5,0.4),rgb(0.8,0.2,0.5,0.4),rgb(0.7,0.5,0.1,0.4))

data <- rbind(rep(20,5), rep(0,5), as.data.frame(tt))
radarchart(data,maxmin = F)
radarchart(data,
           axistype = 1,
           maxmin = F,
           pcol = colors_border,
           pfcol = colors_in,
           plwd = 4,
           plty = 1,
           cglcol = "black",
           cglty = 1,
           axislabcol = "black",
           caxislabels = seq(0,20,5),
           cglwd = 0.8,
           vlcex = 0.8
           )

