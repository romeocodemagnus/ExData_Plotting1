# Read the data
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
# Convert the date column to Date class
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
# Subset the data to include the desired dates
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"),]
# Convert Date and Time columns to POSIXlt class
d$Date <- as.POSIXlt(paste(as.Date(d$Date, format="%d/%m/%Y"), d$Time, sep=" "))
# Start a PNG device
png("plot4.png", width=480, height=480)
# Control margins with mar and plots in columns and rows via mfrow
par(mar=c(5.0, 5.0, 1.2, 0.8), mfrow=c(2,2))
# plot 1
plot(d$Date, d$Global_active_power, type="l",
     xlab="", ylab="Global Active Power")
#plot 2
plot(d$Date, d$Voltage, type="l",
     xlab="datetime", ylab="Voltage")
# plot 3
plot(d$Date, d$Sub_metering_1, type="n", lwd=1,
     ylim=c(0, max(c(d$Sub_metering_1, d$Sub_metering_2, d$Sub_metering_3))),
     xlab="", ylab="Energy sub metering")
# annotate plot 3 with lines
lines(d$Date, d$Sub_metering_1, col="black")
lines(d$Date, d$Sub_metering_2, col="red")
lines(d$Date, d$Sub_metering_3, col="blue")
# annotate plot 3 with legend
legend("topright", lwd=1,
       col=c("black", "red", "blue"),
       legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"),
       box.lwd=0)
# plot 4
plot(d$Date, d$Global_reactive_power, type="l",
     xlab="datetime", ylab="Global Reactive Power")

dev.off()
