#Reading from txt file 
#Sub setting by by dates between 1/2/2007 to 2/2/2007

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Exploring the data 
head(subData)

#Convererting Global_active_power to numeric 
#Convererting Global_Reactive_power to numeric
#Convererting Voltage to numeric 
#Convererting subMetering to numeric 

globalActivePower <- as.numeric(subData$Global_active_power)
globalReactivePower <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

#Converting to date time format

date <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Setting Device to PNG with 480X480
#Setting rows =2 cols = 2 of plots in device printing 

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))

#Creating a plot  of globalActivePower by date and time 

plot(date, globalActivePower, type="l",ylab="Global Active Power", xlab="", cex=0.2)

#Creating a plot  of voltage by date and time 

plot(date, voltage, type="l", xlab="datetime", ylab="Voltage")

#Creating a plot  of subMetering by date and time 

plot(date, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(date, subMetering2, type="l", col="red")
lines(date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=2, cex = 0.75)

#Creating a plot  of globalReactivePower by date and time 

plot(date, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
