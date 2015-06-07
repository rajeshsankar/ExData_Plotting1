setwd("C:/bd/coursera/wd")

pwr <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", 
                  colClasses = c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", 
                                 "numeric"),
                  #na.strings = c("?"),
                  na = "?",
                  fill = TRUE, strip.white = TRUE)

pwrsub <- subset(pwr, pwr$Date %in% c("1/2/2007", "2/2/2007"))
pwrsub$Date <- as.Date(pwrsub$Date, format="%d/%m/%Y")
pwrsub$Time <- strptime(paste(pwrsub$Date, pwrsub$Time), format="%Y-%m-%d %H:%M:%S")

png("plot4.png", w = 480, h = 480)

par(mfrow = c(2, 2), mar = c(4, 4, 3, 3))

with (pwrsub, {
    
    plot(pwrsub$Time, pwrsub$Global_active_power, type = "l", 
         xlab = "",
         ylab = "Global Active Power")

    plot(pwrsub$Time, pwrsub$Voltage, type = "l", 
         xlab = "datetime",
         ylab = "Voltage")

    with(pwrsub, plot(pwrsub$Time, pwrsub$Sub_metering_1, type = "s", 
                      xlab = "", ylab = "Energy sub metering"))
    with(pwrsub, points(pwrsub$Time, pwrsub$Sub_metering_2, type = "s", col="Red"))
    with(pwrsub, points(pwrsub$Time, pwrsub$Sub_metering_3, type = "s", col="Blue"))
    
    legend("topright", lty=1, bty = "n", cex = 0.7,# pt.cex = 4,
           col = c("black", "red", "blue"), 
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(pwrsub$Time, pwrsub$Global_reactive_power, type = "l", 
         xlab = "datetime",
         ylab = "Global_reactive_power")

    })

dev.off()
