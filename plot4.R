#plot4.R
classes <- c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric") 
data <- read.table("household_power_consumption.txt", sep=";", header=TRUE, colClasses = classes, na.strings="?")
data <- data[data$Date %in% c("1/2/2007","2/2/2007"), ]

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

## plot TL - Global Active Power
plot(data$DateTime, data$Global_active_power, pch=NA, xlab="", ylab="Global Active Power")
lines(data$DateTime, data$Global_active_power)

## plot TR - Voltage
plot(data$DateTime, data$Voltage, xlab="datetime", ylab="Voltage", pch=NA)
lines(data$DateTime, data$Voltage)

## plot BL - Sub metering
plot(data$DateTime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col = c("black", "red", "blue"), lty = c(1, 1, 1), bty = 'n')

# plot BR - Global Reactive Power
with(data, plot(DateTime, Global_reactive_power, xlab="datetime", pch=NA))
with(data, lines(DateTime, Global_reactive_power))

dev.off()

