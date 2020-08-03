# Importing data
EPC_data = read.table("~/Desktop/Coursera/R/Course4/household_power_consumption.txt", sep = ";", header = TRUE)

View(EPC_data)
dim(EPC_data)

# Subsetting data for the given dates
EPC_sub <- subset(EPC_data,EPC_data$Date=="1/2/2007" | EPC_data$Date =="2/2/2007")
View(EPC_sub)
EPC_sub$Global_active_power <- as.numeric(EPC_sub$Global_active_power)
EPC_sub$Sub_metering_1 <- as.numeric(EPC_sub$Sub_metering_1)
EPC_sub$Sub_metering_2 <- as.numeric(EPC_sub$Sub_metering_2)
EPC_sub$Sub_metering_3 <- as.numeric(EPC_sub$Sub_metering_3)
# Creating datetime variable
EPC_sub$date_time <- strptime(paste(EPC_sub$Date, EPC_sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
head(date_time)

# Submetering plot with day
png("plot3.png", width=480, height=480)
plot(EPC_sub$date_time, EPC_sub$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(EPC_sub$date_time, EPC_sub$Sub_metering_2, type="l", col="red")
lines(EPC_sub$date_time, EPC_sub$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col=c("black", "red", "blue"))
dev.off()


