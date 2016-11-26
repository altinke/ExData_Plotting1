#
# Download the data from https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Since the data is extensive this file is not stored in the GitHub project
#

# Normally there wouldn't be comments with a exploratory graphs
# These graphs are quick and dirty

# Read the data in a variable and take a subset
power_consumption <- read.csv("household_power_consumption.txt", sep=";", header=TRUE,stringsAsFactors=FALSE,na.strings="?")
power_feb <- power_consumption[(power_consumption$Date=="1/2/2007" | power_consumption$Date=="2/2/2007" ), ]

# Plot the histogram to a PNG file
png("plot1.png", width = 480, height = 480, units = "px")
hist(power_feb$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", c="red")
dev.off()
# Don't forget to close the device