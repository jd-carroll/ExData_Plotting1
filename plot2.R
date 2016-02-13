##########################################
# Exploratory Data Analysis
# Wk1 Course Project
#
##########################################


# Load the data
##########################################
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
temp <- tempfile()
download.file(fileUrl, temp)
data <- read.table(unz(temp, "household_power_consumption.txt"), sep = ";", header = TRUE, na.strings=c("?"))
unlink(temp)


# Clean the data
##########################################
data$Date <- as.Date(data$Date, "%d/%m/%Y")


# Filter the data
##########################################
february <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")


# Setup plot variables
##########################################
february$timestamp <- as.POSIXct(paste(february$Date, february$Time), format="%Y-%m-%d %H:%M:%S")

dev.new(width = 480, height = 480)


# Plot the data
##########################################
plot(february$timestamp, february$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")


# Save the plot
##########################################
dev.copy(png, "plot2.png")
dev.off()
