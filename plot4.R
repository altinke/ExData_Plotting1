#
# Download the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Since the data is extensive this file is not stored in the GitHub project
#

# Normally there wouldn't be comments with a exploratory graphs
# These graphs are quick and dirty

# Read the data in a variable and take a subset
power_consumption <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
power_feb <- power_consumption[(power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007" ), ]

# format date and time
# The date and time are printed in the local format
power_feb$Date <- as.Date(power_feb$Date, format="%d/%m/%Y")
dateTime <- paste(power_feb$Date, power_feb$Time)
power_feb$DateTime <- as.POSIXct(dateTime)

# Plot the graph to a PNG file
png("plot4.png", width = 480, height = 480, units = "px")
# settings for displaying the graphs
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(power_feb, {
  # first graph
  plot(Global_active_power ~ DateTime, type = "l", ylab = "Global Active Power", xlab = "", cex = 0.8)
  # second graph
  plot(Voltage ~ DateTime, type = "l", ylab = "Voltage", cex = 0.8)
  # third graph
  plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = "", cex = 0.8)
  lines(Sub_metering_2 ~ DateTime, col = "red")
  lines(Sub_metering_3 ~ DateTime, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, 
         lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         cex = 0.5)
  # forth graph
  plot(Global_reactive_power ~ DateTime, type = "l",
      cex = 0.8)
})
# Don't forget to close the device
dev.off()