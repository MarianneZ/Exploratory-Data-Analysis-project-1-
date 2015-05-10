# reading the file to the table
data <- read.table("household_power_consumption.txt", header=T, sep=";")
# recording values to missing
is.na(data) <- data =="?"
# cleaning the data from NAs
good_data <- na.omit(data)
# converting the Date column into the Date format
good_data$Date <- as.Date(good_data$Date, format="%d/%m/%Y")
# creating the subset with data of two appropriate dates
final_data <- subset(good_data, Date=="2007-02-01" | Date=="2007-02-02", select = Date:Sub_metering_3)
#converting the data into numeric
final_data$Global_active_power <- as.numeric(as.character(final_data$Global_active_power))
# creating the gistogram
hist(final_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowats)", col = "red")
# recording to png file
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()