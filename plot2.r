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
png(file="plot2.png")

# Make plot
plot(power$date.time, power$Global_active_power,
     ylab='Global Active Power (kilowatts)', xlab='', type='l')

# Turn off device
dev.off()


