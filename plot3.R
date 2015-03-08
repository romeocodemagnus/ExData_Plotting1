## Read the data
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
## Convert the date column to Date class
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
## Subset the data to include the desired dates
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"),]
## Convert Date and Time columns to POSIXlt class
d$Date <- as.POSIXlt(paste(as.Date(d$Date, format="%d/%m/%Y"), d$Time, sep=" "))
## Start a PNG device
png("plot3.png", width=480, height=480)
## Control margins
par(mar=c(5.0, 5.0, 1.2, 0.8))
##plot all 3 submeter readings vs. time
plot(d$Date, d$Sub_metering_1, type="n", lwd=0.5,
     ylim=c(0, max(c(d$Sub_metering_1, d$Sub_metering_2, d$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")
##annotate with lines
lines(d$Date, d$Sub_metering_1, col="black")
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")
##add legend to top right corner
legend("topright", lwd=1,
       col=c("black", "red", "blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
