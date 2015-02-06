source("load_data.R")

png(filename = "plot4.png", width = 480, height = 480)

## define 4 plots -> 2 rows 2 cols
par(mfrow = c(2, 2))

## Top-left
plot(x = data$DateTime, y = data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power")

## Top-right
plot(x = data$DateTime, y = data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

## Bottom-left
plot(x = data$DateTime, y = data$Sub_metering_1, type = "l", col = "black", xlab = "", 
     ylab = "Energy sub metering")
lines(x = data$DateTime, y = data$Sub_metering_2, col = "red")
lines(x = data$DateTime, y = data$Sub_metering_3, col = "blue")

# Remove the border of legend here.
legend("topright",
       bty = "n",
       col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

## Bottom-right
plot(x = data$DateTime, y = data$Global_reactive_power, type = "l", col = "black", xlab = "datetime", 
     ylab = "Global_reactive_power")

dev.off()