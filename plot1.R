# plot1.R

# File download (first time only)
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl, destfile="house_power_consumption.zip", method="curl")
unzip("house_power_consumption.zip")

# plot1
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = classes, na.strings="?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

png("plot1.png", width=480, height=480)
par(mfrow=c(1,1))
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()
