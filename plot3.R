#Reading from txt file 
#Sub setting by by dates between 1/2/2007 to 2/2/2007

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Exploring the data 
head(subData)

#Convererting Global_active_power to numeric 
#Convererting subMetering to numeric 

globalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

#Converting to date time format

date <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Setting Device to PNG with 480X480
#Creating a histogram of subMetering1 by date and time 
#Adding lines one by one to the plot 
#Setting title and axis description
#Addding description to the plot 

png("plot3.png", width=480, height=480)
plot(date, subMetering1, type="l", xlab="", ylab="Energy Submetering")
lines(date, subMetering2, type="l", col="red")
lines(date, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex = 0.75)
dev.off()

