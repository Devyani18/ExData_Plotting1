library(dplyr)
library(chron)
data <- read.delim2("household_power_consumption.txt",sep = ";",na.strings = "?")
data <- as_tibble(data)
data$Time <- times(data$Time)
required <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
required$Global_active_power <- as.numeric(required$Global_active_power)
datetime <- strptime(paste(required$Date,required$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#Plot3
png("plot3.png",width = 480,height = 480)

required$Sub_metering_1 <- as.numeric(required$Sub_metering_1)
required$Sub_metering_2 <- as.numeric(required$Sub_metering_2)
required$Sub_metering_3 <- as.numeric(required$Sub_metering_3)
plot(datetime,required$Sub_metering_1, type="n",xlab="",ylab = "Energy sub metering")
lines(datetime,required$Sub_metering_1)
lines(datetime,required$Sub_metering_2,col="red")
lines(datetime,required$Sub_metering_3,col="blue")
legend("topright",lty = 1,col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()