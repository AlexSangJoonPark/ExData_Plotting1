#plot2.R
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = classes, na.strings="?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
par(mfrow=c(1,1))

plot(data$DateTime, data$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(data$DateTime, data$Global_active_power)

dev.off()
