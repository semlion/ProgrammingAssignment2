hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$fulldate <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc_sub <- subset(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
View(hpc_sub)

plot(hpc_sub$fulldate, hpc_sub$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(hpc_sub$fulldate, hpc_sub$Sub_metering_2, type = "l", col = "red")
points(hpc_sub$fulldate, hpc_sub$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()