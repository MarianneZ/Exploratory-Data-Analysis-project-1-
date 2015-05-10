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
# join Date and Time data together and transform into POSIXct class
final_data <- transform(final_data, time_date=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
# converting the data into numeric
final_data$Sub_metering_1 <-  as.numeric(as.character(final_data$Sub_metering_1))
final_data$Sub_metering_2 <-  as.numeric(as.character(final_data$Sub_metering_2))
final_data$Sub_metering_3 <-  as.numeric(as.character(final_data$Sub_metering_3))
# creating the plot
plot(final_data$time_date, final_data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(final_data$time_date, final_data$Sub_metering_2, col = "red")
lines(final_data$time_date, final_data$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
# recording to png file
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()