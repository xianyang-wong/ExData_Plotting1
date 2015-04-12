# fetches full dataset
base<- read.table('household_power_consumption.txt', header=TRUE,
                   sep=';', na.strings='?',
                   colClasses=c(rep('character', 2), 
                                rep('numeric', 7)))

library(lubridate)
base$Date <- dmy(base$Date)
base$Time <- hms(base$Time)

power <- subset(base,year(Date) == 2007 & 
                  month(Date) == 2 &
                  (day(Date) == 1 | day(Date) == 2))

power$date.time <- power$Date + power$Time

# Open png device
png(file="plot1.png")

# Make plot
hist(power$Global_active_power, main='Global Active Power', 
     xlab='Global Active Power (kilowatts)', col='red')

# Turn off png device
dev.off()


