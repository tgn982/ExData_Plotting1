library(sqldf)
library(lattice)

## Using read.csv.sql, read Data only Date 1/2/2007 and 2/2/2007. 
## If we know some SQL grammer, no subsetting is needed.
HPC <- read.csv.sql("household_power_consumption.txt",sep=";", sql = "select * from file where Date = '1/2/2007' OR Date ='2/2/2007'", eol = "\n")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")
HPC$date_time <- strptime(paste(HPC$Date, HPC$Time), format = "%Y-%m-%d %H:%M:%S")

## save to plot2.png
png(file = "plot2.png", width =480, height =480)


## plot 2nd plot
plot(HPC$date_time, HPC$Global_active_power, type = "l", ylab = "Global Active Power (kilowatt)")

## dev.off to complelte file
dev.off()
