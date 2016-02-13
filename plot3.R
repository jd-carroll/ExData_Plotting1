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

# The legend does not appear correctly in the png when copying, so write directly to png when saving
png(filename = "plot3.png", width = 480, height = 480)
# If trying to view the graphic immediately comment the above line and uncomment the line below
#dev.new(width = 480, height = 480)


# Plot the data
##########################################
plot(february$timestamp, february$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(february$timestamp, february$Sub_metering_1)
lines(february$timestamp, february$Sub_metering_2, col = "red")
lines(february$timestamp, february$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","blue","red"))


# Save the plot
##########################################
#dev.copy(png, "plot3.png")
dev.off()

