#plot3.R
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = classes, na.strings="?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

png("plot3.png", width=480, height=480)
par(mfrow=c(1,1))

plot(data$DateTime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1, 1))

dev.off()