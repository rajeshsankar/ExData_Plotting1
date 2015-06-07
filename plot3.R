setwd("C:/bd/coursera/wd")

pwr <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", 
                  colClasses = c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", 
                                 "numeric"),
                  na = "?",
                  fill = TRUE, strip.white = TRUE)


pwrsub <- subset(pwr, pwr$Date %in% c("1/2/2007", "2/2/2007"))
pwrsub$Date <- as.Date(pwrsub$Date, format="%d/%m/%Y")
pwrsub$Time <- strptime(paste(pwrsub$Date, pwrsub$Time), format="%Y-%m-%d %H:%M:%S")

png("plot3.png", w = 480, h = 480)

with(pwrsub, plot(pwrsub$Time, pwrsub$Sub_metering_1, type = "s", 
                  xlab = "", ylab = "Energy sub metering"))
with(pwrsub, points(pwrsub$Time, pwrsub$Sub_metering_2, type = "s", col="Red"))
with(pwrsub, points(pwrsub$Time, pwrsub$Sub_metering_3, type = "s", col="Blue"))

legend("topright", lty=1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
