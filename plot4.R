# set working directory
setwd("Coursera/ExploratoryDataAnalysis/CourseProject1/ExData_Plotting1") 
# read initial 5 rows to get classes, use classes as vector to assign colClasses
initial <- read.table("household_power_consumption.txt", header=TRUE, sep=";", nrows=5)
classes <- sapply(initial, class)
alldata <- read.csv("household_power_consumption.txt", header=TRUE, na.strings="?", sep=";", colClasses = classes)
#Create subset with dates 2007-02-01 and 2007-02-02
datessubset <- alldata$Date=="1/2/2007" | alldata$Date=="2/2/2007"
specdata <- alldata[datessubset, ]
# Convert Time column from factor to time variable including date column
specdata$DateTime <- paste(specdata$Date, specdata$Time)
specdata$DateTime <- strptime(specdata$DateTime, "%d/%m/%Y %H:%M:%S")

# make plot4
png(filename = "plot4.png", width = 480, height = 480, units = "px", bg="transparent")
par(mfcol = c(2, 2))
plot(specdata$DateTime, specdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
plot(specdata$DateTime, specdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(specdata$DateTime, specdata$Sub_metering_2, type="l", col="red1")
lines(specdata$DateTime, specdata$Sub_metering_3, type="l", col="blue1")
legend("topright", bty="n", lty = c(1, 1, 1), col = c("black", "red1", "blue1"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(specdata$DateTime, specdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(specdata$DateTime, specdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()