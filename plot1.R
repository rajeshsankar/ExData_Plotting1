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

png("plot1.png", w = 480, h = 480)
hist(pwrsub$Global_active_power, 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     col="red")

dev.off()

