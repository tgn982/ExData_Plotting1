library(sqldf)
library(lattice)

## Using read.csv.sql, read Data only Date 1/2/2007 and 2/2/2007. 
## If we know some SQL grammer, no subsetting is needed.
HPC <- read.csv.sql("household_power_consumption.txt",sep=";", sql = "select * from file where Date = '1/2/2007' OR Date ='2/2/2007'", eol = "\n")
HPC$Date <- as.Date(HPC$Date, format = "%d/%m/%Y")

## save to plot1.png
png(file = "plot1.png", width =480, height =480)

## plot first histogram
hist(HPC$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## dev.off to complelte file
dev.off()