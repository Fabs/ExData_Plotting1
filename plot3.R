#Plot2 - Frequency x Global Active Power

#Load and Format Data
col_types = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
data <- read.csv('data/household_power_consumption.txt', sep =";", na.string="?", colClasses = col_types, header= TRUE);
data$Date_Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Prepare Plot
from <- as.Date("2007-02-01")
to <- as.Date("2007-02-02")
subset_data <- subset(data, as.Date(Date_Time) >= from & as.Date(Date_Time) <= to)
x1_axis <- subset_data$Global_active_power
x2_axis <- subset_data$Sub_metering_1
y_axis <- subset_data$Date_Time

#Plot to PNG
png("plot2.png")
plot(y_axis, x1_axis, x2_axis, type='l', ylab='Global Active Power (kilowatts)', xlab="", height=480, width=480);
dev.off()
