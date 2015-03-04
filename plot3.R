## Getting complete dataset. The data is already present in the working directory
data_complete <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?",
                          nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_complete$Date <- as.Date(data_complete$Date, format="%d/%m/%Y")


## Subsetting the data as we are only interested in a certain range of dates
data <- subset(data_complete, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## Converting dates appropriatley
date_and_time <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(date_and_time)

## upto this point the program is a replica of plot1.R

## Construct plot 3
with(data, {
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()