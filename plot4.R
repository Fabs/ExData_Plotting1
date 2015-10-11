#Plot4 - Frequency x Global Active Power

#Load and Format Data
col_types = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
data <- read.csv('data/household_power_consumption.txt', sep =";", na.string="?", colClasses = col_types, header= TRUE);
data$Date_Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Prepare Plots
from <- as.Date("2007-02-01")
to <- as.Date("2007-02-02")
subset_data <- subset(data, as.Date(Date_Time) >= from & as.Date(Date_Time) <= to)
s1_line <- x_axis
s2_line <- subset_data$Sub_metering_2
s3_line <- subset_data$Sub_metering_3
y_axis <- subset_data$Date_Time

lines <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
line_lty <- c(1,1,1)
line_color <- c("black", "red", "blue")

#Plot Layout
png("plot4.png")
par(mfrow=c(2,2))

#1 - Global Active Power Plot
x_axis <- subset_data$Global_active_power
plot(y_axis, x_axis, type='l', ylab='Global Active Power (kilowatts)', xlab="", height=480, width=480)

#2 - Voltage Plot
x_axis <- subset_data$Voltage
plot(y_axis, x_axis, type='l', ylab="Voltage", xlab="datetime", height=480, width=480)

#3 - Sub Metering Plot
x_axis <- subset_data$Sub_metering_1
plot(y_axis, x_axis, type='l', ylab='Energy sub metering', xlab="", height=480, width=480)
lines(y_axis, s2_line, col="red")
lines(y_axis, s3_line, col="blue")
legend('topright', lines, lty=line_lty, col=line_color, bty='n')

#4 - Global Reactive Power Plot
x_axis <- subset_data$Global_reactive_power
plot(y_axis, x_axis, type='l', ylab="Global_reactive_power", xlab="datetime", height=480, width=480)


dev.off()
