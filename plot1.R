## Getting complete dataset. The data is already present in the working directory
data_complete <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")


## Subsetting the data as we are only interested in a certain range of dates
data <- subset(data_complete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates appropriatley
date_and_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_and_time)

## upto this point all four scripts are the exact same

## Construct plot 1
hist(data$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to plot1.png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
