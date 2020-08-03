# Importing data
EPC_data = read.table("~/Desktop/Coursera/R/Course4/household_power_consumption.txt", sep = ";", header = TRUE)

View(EPC_data)
dim(EPC_data)

# Subsetting data for the given dates
EPC_sub <- subset(EPC_data,EPC_data$Date=="1/2/2007" | EPC_data$Date =="2/2/2007")
View(EPC_sub)
# Global Active Power plot png
png("plot1.png", width = 480, height = 480)
hist(EPC_sub$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (Kilowatts)")
dev.off()