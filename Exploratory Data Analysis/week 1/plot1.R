getwd()
data_file <- "Data/household_power_consumption.txt"
?read.table()
df <- read.table(data_file,sep=";")#na.strings = "NA"
head(df,2)
library(dplyr)
df$Date <- as.Date(df$Date,"%d/%m/%Y")
class(df$Date)
# 2007-02-01 and 2007-02-02
df1 <- subset(df,Date>="2007-02-01" & Date <= "2007-02-02")
dim(df1)
rownames(df1)
#write.csv(df1,"Data/subsetted_file.csv")
head(df1,2)
df1$Global_active_power <- as.numeric(df1$Global_active_power)
hist(df1$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
? hist
