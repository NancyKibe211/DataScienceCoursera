png("plot3.png", width=480, height=480)

plot(df$datetime,df$Sub_metering_1,type = "l",xlab=" ")
lines(df$datetime,df$Sub_metering_2,type = "l",col="red")
lines(df$datetime,df$Sub_metering_3,type = "l",col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()