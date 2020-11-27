library(dplyr)
library(chron)
data <- read.delim2("household_power_consumption.txt",sep = ";",na.strings = "?")
data <- as_tibble(data)
data$Time <- times(data$Time)
required <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
required$Global_active_power <- as.numeric(required$Global_active_power)
datetime <- strptime(paste(required$Date,required$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#Plot4
required$Voltage <- as.numeric(required$Voltage)

png("plot4.png",width = 480,height = 480)
par(mfrow=c(2,2))

plot(datetime,required$Global_active_power,xlab = "",ylab = "Global Active Power",type = 'l')

plot(datetime,required$Voltage,ylab = "Voltage",type = 'l')

plot(datetime,required$Sub_metering_1, type="n",xlab="",ylab = "Energy sub metering")
lines(datetime,required$Sub_metering_1)
lines(datetime,required$Sub_metering_2,col="red")
lines(datetime,required$Sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(datetime,required$Global_reactive_power,ylab = "Global_reactive_power",type = 'l')

dev.off()