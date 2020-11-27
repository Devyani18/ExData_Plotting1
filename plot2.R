library(dplyr)
library(chron)
data <- read.delim2("household_power_consumption.txt",sep = ";",na.strings = "?")
data <- as_tibble(data)
data$Time <- times(data$Time)
required <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")
required$Global_active_power <- as.numeric(required$Global_active_power)
datetime <- strptime(paste(required$Date,required$Time,sep=" "),"%d/%m/%Y %H:%M:%S")

#Plot2
png("plot2.png",width = 480,height = 480)
plot(datetime,required$Global_active_power,ylab = "Global Active Power(kilowatts)",type = "l",xlab = "")
dev.off()