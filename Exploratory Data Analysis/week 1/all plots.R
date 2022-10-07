data_file <- "Data/household_power_consumption.txt"
df <- read.table(data_file,sep=";")
head(df,2)


library(lubridate)
library(dplyr)

df1 <- df[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df1 <- subset(df,Date>="2007-02-01" & Date <= "2007-02-02")
#write.csv(df1,"Data/subsetted_file.csv")


# load the new dataframe
data_file_new <- "Data/subseted_file.csv"
df <- read.csv(data_file_new)
library(lubridate)
library(dplyr)

# combine date and time 
df$datetime <- paste(df$Date, df$Time)
df$datetime <- as.POSIXct(df$datetime, format = "%Y-%m-%d %H:%M:%S")
head(df$datetime,3)
str(df)

#========================================
#===========   plot 1 ======================
#========================================
# create histogram of Global_active_power
# save to
png("plot1.png", width=480, height=480) 

hist(df1$Global_active_power,col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")

dev.off()
#========================================
#===========   plot 2 ======================
#========================================

# save to
png("plot2.png", width=480, height=480)

plot(df$datetime,df$Global_active_power,type="l",xlab=" ",
     ylab="Global Active Power (kilowatts)")

dev.off()



#========================================
#===========   plot 3 ======================
#========================================
# save to
png("plot3.png", width=480, height=480)

plot(df$datetime,df$Sub_metering_1,type = "l",xlab=" ")
lines(df$datetime,df$Sub_metering_2,type = "l",col="red")
lines(df$datetime,df$Sub_metering_3,type = "l",col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
#========================================
#===========   plot 4 ======================
#========================================


png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
# Plot 1
plot(df$datetime,df$Global_active_power, type="l", xlab=" ", 
     ylab="Global Active Power")
# Plot 2
plot(df$datetime,df$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
# Plot 3
plot(df$datetime, df$Sub_metering_1, type="l", xlab=" ",
     ylab="Energy sub metering")
lines(df$datetime, df$Sub_metering_2, col="red")
lines(df$datetime, df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"),
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1),
       bty="n",
       cex=.5) 
# Plot 4
plot(df$datetime, df$Global_active_power, type="l",
     xlab="datetime", ylab="Global_reactive_power")

dev.off()
