## Read the dataset
d <- read.table("household_power_consumption.txt", sep=";", header=T, colClasses=c("character", "character", rep("numeric", 7)), na.strings="?")
## Convert the date column to Date class
d$Date <- as.Date(d$Date, format="%d/%m/%Y")
## Subset the data rows to filter the desired dates
d <- d[d$Date >= as.Date("2007-02-01") & d$Date<=as.Date("2007-02-02"),]
## Open a PNG device
png("plot1.png", width=480, height=480)
##control the margins
par(mar=c(4.8, 4.8, 2.0, 0.8))
##Draw the histogram of global_active_power
hist(d$Global_active_power, breaks=12, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()