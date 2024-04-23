# Q : 1
# Use Titanic dataset and apply bar plot on it
Titanic

df = as.data.frame(Titanic)
df

c1 = sum(as.vector(t(df[df$Survived=="Yes" & df$Class=="1st",c(5)])))
c1
c2 = sum(as.vector(t(df[df$Survived=="No" & df$Class=="1st",c(5)])))
c2
first = rbind(c1,c2)
first

c3 = sum(as.vector(t(df[df$Survived=="Yes" & df$Class=="2nd",c(5)])))
c3
c4 = sum(as.vector(t(df[df$Survived=="No" & df$Class=="2nd",c(5)])))
c4
second = rbind(c3,c4)
second

c5 = sum(as.vector(t(df[df$Survived=="Yes" & df$Class=="3rd",c(5)])))
c5
c6 = sum(as.vector(t(df[df$Survived=="No" & df$Class=="3rd",c(5)])))
c6
third = rbind(c5,c6)
third

c7 = sum(as.vector(t(df[df$Survived=="Yes" & df$Class=="Crew",c(5)])))
c7
c8 = sum(as.vector(t(df[df$Survived=="No" & df$Class=="Crew",c(5)])))
c8
cr = rbind(c7,c8)
cr

t = cbind(first,second,third,cr)
t

rownames(t) = c("Survived","Not Survived")
colnames(t) = c("1st","2nd","3rd","crew")
t

#ploting by stack
barplot(t,
        col=2:3,
        xlab = "Class",
        ylab = "Frequence",
        main = "Stackrd bar plot of survival an non_survival frequency"
        )

legend("topleft",
       legend = c("Survived","Not Survived"),
       col = 2:3,
       lty = 1,
       title = "Survival"
       )

#ploting by group
barplot(t,
        beside = TRUE,
        col = 2:3,
        xlab = "Class",
        ylab = "Frequence",
        main = "Grouped bar plot of survival an non_survival frequency"
        )

legend("topleft",
       legend = c("Survived","Not Survived"),
       col = 2:3,
       lty = 1,
       title = "Survival"
       )

# Q : 2
# Use VADeaths dataset and bar plot on it
VADeaths

df1 = as.data.frame(VADeaths)
str(df1)
summary(df1)
df1

c_rural_male = df1$'Rural Male'
c_urban_male = df1$'Urban Male'

rural = c_rural_male/sum(c_rural_male)
urban = c_urban_male/sum(c_urban_male)

M = cbind(rural,urban)
M

#ploting by stack
barplot(M,
        col=2:6,
        xlab = "Location of Male",
        ylab = "Proportion of Death Rates",
        main = "Stackrd bar plot of urban male and rural male death rates comparison"
        )

legend("topleft",
       legend = c("50-54","55-59","60-64","65-69","70-74"),
       col = 2:6,
       lty = 1,
       title = "Age Group"
       )

#ploting by group
barplot(as.matrix(df1),
        beside = TRUE,
        col = 2:6,
        xlab = "Location of Male",
        ylab = "Proportion of Death Rates",
        main = "Grouped bar plot of urban male and rural male death rates comparison"
        )

legend("topleft",
       legend = c("50-54","55-59","60-64","65-69","70-74"),
       col = 2:6,
       lty = 1,
       title = "Age Group"
       )

# Q : 3
# Use USPersonalExpenditure dataset and plot the data
USPersonalExpenditure

df2 = as.data.frame(USPersonalExpenditure)
str(df2)
summary(df2)
df2

yr = c(1940,1945,1950,1955,1960)

plot(x,as.vector(sapply(df2,sum)),
     type = "l",
     xlab = "Year",
     ylab = "Total Expenditure(in billions of dollars) in the US"
     )

barplot(as.matrix(df2),
        col=2:6,
        xlab = "Total Expenditure(in billions of dollars)",
        ylab = "Years",
        main = "Stacked bar plot to show categories of Expenditure vs Years"
        )

legend("topleft",
       legend = c("Food and Tobacco","Household Operations","MEdical and Health","Personal Care","Private Education"),
       col = 2:8,
       lty = 1,
       title = "Categories"
       )

pie(as.vector(sapply(df2,sum)),
    yr,
    col = 2:6,
    main = "Piechart of total Expenditure"
    )


