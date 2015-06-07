setwd("C:/bd/coursera/wd")

pwr <- read.table("data/household_power_consumption.txt", header = TRUE, sep = ";", 
                  colClasses = c("character", "character", "numeric", "numeric", 
                                 "numeric", "numeric", "numeric", "numeric", 
                                 "numeric"),
                  na.strings = c("?"),
                  fill = TRUE, strip.white = TRUE)



pwrsub <- subset(pwr, pwr$Date %in% c("1/2/2007", "2/2/2007"))
as.Date(pwrsub$Date, format="%d/%m/%Y")

png("plot1.png", w = 480, h = 480)
hist(pwrsub$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     #h = 480,
     col="red")

dev.off()

