source("load_data.R")

png(filename = "plot1.png", width = 480, height = 480)

hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     ylim = c(0, 1200))

dev.off()