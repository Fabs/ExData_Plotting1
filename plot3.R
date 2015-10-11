#Plot2 - Frequency x Global Active Power

#Load and Format Data
col_types = c('character', 'character', 'numeric','numeric', 'numeric', 'numeric','numeric', 'numeric', 'numeric')
data <- read.csv('data/household_power_consumption.txt', sep =";", na.string="?", colClasses = col_types, header= TRUE)
data$Date_Time <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

#Prepare Plot
from <- as.Date("2007-02-01")
to <- as.Date("2007-02-02")
subset_data <- subset(data, as.Date(Date_Time) >= from & as.Date(Date_Time) <= to)
x_axis <- subset_data$Sub_metering_1
s1_line <- x_axis
s2_line <- subset_data$Sub_metering_2
s3_line <- subset_data$Sub_metering_3
y_axis <- subset_data$Date_Time

lines <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
line_lty <- c(1,1,1)
line_color <- c("black", "red", "blue")

#Plot to PNG
png("plot3.png")
plot(y_axis, x_axis, type='l', ylab='Energy sub metering', xlab="", height=480, width=480)
lines(y_axis, s2_line, col="red")
lines(y_axis, s3_line, col="blue")
legend('topright', lines, lty=line_lty, col=line_color)

dev.off()
