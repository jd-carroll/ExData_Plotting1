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


# Parse the data
##########################################
february <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")


# Setup plot variables
##########################################
dev.new(width = 480, height = 480)


# Plot the data
##########################################
hist(february$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")


# Save the plot
##########################################
dev.copy(png, "plot1.png")
dev.off()
