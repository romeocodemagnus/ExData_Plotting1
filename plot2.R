## Read the dataset
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
## Convert the date column to Date class
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
## Subset the data to filter using the desired dates:
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"),]
## Convert Date and Time columns to POSIXlt
d$Date <- as.POSIXlt(paste(as.Date(d$Date, format="%d/%m/%Y"), d$Time, sep=" "))
## Start a PNG device
png("plot2.png", width=480, height=480)
##Control the margins
par(mar=c(5.0, 5.0, 1.2, 0.8))
##Plot Global_active_power vs. time
plot(d$Date, d$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()