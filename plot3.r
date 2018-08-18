library(sqldf)
library(lattice)

## Using read.csv.sql, read Data only Date 1/2/2007 and 2/2/2007. 
## If we know some SQL grammer, no subsetting is needed.
HPC <- read.csv.sql("household_power_consumption.txt",sep=";", sql = "select * from file where Date = '1/2/2007' OR Date ='2/2/2007'", eol = "\n")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC$date_time <- strptime(paste(HPC$Date, HPC$Time), format = "%Y-%m-%d %H:%M:%S")

## save to plot3.png
png(file = "plot3.png", width =480, height =480)

## plot 3rd plot
library(lattice)
## xyplot( Sub_metering_1 + Sub_metering_2 + Sub_metering_3 ~ date_time , data=HPC, type = c('l','l','l'), col = c("black","red", "blue"), auto.key = T)

plot( HPC$date_time , HPC$Sub_metering_1, col = "black", type ="l", ylab = "Energy sub metering")        
lines(HPC$date_time , HPC$Sub_metering_2, col = "red")
lines(HPC$date_time , HPC$Sub_metering_3, col = "blue")
legend ("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = c(2,2,2), col = c("black","red","blue"))

## dev.off to complelte file
dev.off()