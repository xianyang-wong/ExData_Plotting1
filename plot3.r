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
png(file="plot3.png")

# Make plot
plot(power$date.time, power$Sub_metering_1, type='l',
     xlab='', ylab='Energy sub metering')
lines(power$date.time, power$Sub_metering_2, col='red')
lines(power$date.time, power$Sub_metering_3, col='blue')
legend('topright', 
       legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col=c('black', 'red', 'blue'), 
       lty='solid')

# Turn off device
dev.off()



