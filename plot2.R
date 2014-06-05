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

# make plot2
png(filename = "plot2.png", width = 480, height = 480, units = "px", bg="transparent")
plot(specdata$DateTime, specdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()