hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
hpc$fulldate <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
hpc_sub <- subset(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
View(hpc_sub)

hist(hpc_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", breaks = 8, xlim = c(0, 6), ylim = c(0,1000))

dev.copy(png, file = "plot1.png", width = 480, height = 480)
dev.off()
