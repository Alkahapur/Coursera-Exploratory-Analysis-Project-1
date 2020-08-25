##### Date: 25-08-2020 #############


#### Read the data ###########
data<-read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, sep =";" )

head(data)
tail(data)
subdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)

############ Date time foormat#######
datetime <- strptime(paste(subdata$Date, subdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

subdata$Sub_metering_1<-as.numeric(subdata$Sub_metering_1)
subdata$Sub_metering_2<-as.numeric(subdata$Sub_metering_2)
subdata$Sub_metering_3<-as.numeric(subdata$Sub_metering_3)




png("plot3.png", width=480, height=480)

plot(datetime, subdata$Sub_metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, subdata$Sub_metering_2, type="l", col="red")
lines(datetime, subdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
