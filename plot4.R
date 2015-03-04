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

## Construct plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
        plot(Global_active_power~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l",
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l",
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l",
             ylab="Global Rective Power (kilowatts)",xlab="")
})

## Save file to plot4.png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()