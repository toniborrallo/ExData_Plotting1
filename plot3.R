source("load_data.R")

png(filename = "plot3.png", width = 480, height = 480)

plot(x = data$DateTime, y = data$Sub_metering_1,
     type = "l",
     col = "black",
     xlab = "", ylab = "Energy sub metering")

lines(x = data$DateTime, y = data$Sub_metering_2, col = "red")

lines(x = data$DateTime, y = data$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lwd = 1)

dev.off()