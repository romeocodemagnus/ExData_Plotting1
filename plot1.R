
## Read the dataset:
data <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
## Convert the date column to Date class:
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
## Subset the data to only include the desired dates:
data <- data[data$Date >= as.Date("2007-02-01") & data$Date<=as.Date("2007-02-02"),]
## Start a PNG device
png("plot1.png", width=500, height=500)
par(mar=c(5.0, 5.0, 1.0, 1.0))
## Plot the histogram of global_active_power:
hist(data$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()