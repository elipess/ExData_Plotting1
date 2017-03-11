#Reading from txt file 
#Sub setting by by dates between 1/2/2007 to 2/2/2007

dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#Exploring the data 
head(subData)

#Convererting Global_active_power to numeric 

globalActivePower <- as.numeric(subData$Global_active_power)

#Setting Device to PNG with 480X480
#Creating a histogram of globalActivePower
#Seetting title and axis description

png("plot1.png", width=480, height=480)
hist(globalActivePower, col = "red", main="Global Active Power", xlab = "Global Active Power(kilowatts", ylab = "Frequency")
dev.off()

