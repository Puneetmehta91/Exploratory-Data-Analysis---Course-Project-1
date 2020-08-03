# Importing data
EPC_data = read.table("~/Desktop/Coursera/R/Course4/household_power_consumption.txt", sep = ";", header = TRUE)

View(EPC_data)
dim(EPC_data)

# Subsetting data for the given dates
EPC_sub <- subset(EPC_data,EPC_data$Date=="1/2/2007" | EPC_data$Date =="2/2/2007")
View(EPC_sub)
EPC_sub$Global_active_power <- as.numeric(EPC_sub$Global_active_power)

# Creating datetime variable
EPC_sub$date_time <- strptime(paste(EPC_sub$Date, EPC_sub$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
head(date_time)

# Global Active Power plot with day
png("plot2.png", width=480, height=480)
plot(EPC_sub$date_time,EPC_sub$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (Kilowatts)")
?plot
dev.off()