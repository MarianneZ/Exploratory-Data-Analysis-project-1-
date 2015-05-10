data <- read.table("household_power_consumption.txt", header=T, sep=";")
is.na(data) <- data =="?"
good_data <- na.omit(data)
good_data$Date <- as.Date(good_data$Date, format="%d/%m/%Y")
final_data <- subset(good_data, Date=="2007-02-01" | Date=="2007-02-02", select = Date:Sub_metering_3)
final_data$Global_active_power <- as.numeric(as.character(final_data$Global_active_power))
hist(final_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowats)", col = "red")
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()