require(dplyr)
require(tidyr)
require(lubridate)

setwd('./R/Data Science Class/data viz class')
# file location 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

# *** Read in data file and filter subset to Feb 1 and 2 ***
epower <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?')
epower$dt <- dmy_hms(paste0(epower$Date, epower$Time))

epowFeb <- epower %>% filter(dt >= as.Date('2007-02-01') & dt < as.Date('2007-02-03'))

# *** create and save plot3 ***
  png(filename = 'plot3.png',
      width = 480,
      height = 480,
      units = 'px')
  with(epowFeb, plot(dt, Sub_metering_1, type = 'l', col = 'black', ylab = 'Energy sub metering', xlab = ''))
  with(epowFeb, points(dt, Sub_metering_2, type = 'l', col = 'red'))
  with(epowFeb, points(dt, Sub_metering_3, type = 'l', col = 'blue'))
  legend(x= 'topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), 
         lty = c(1, 1, 1), 
         col = c('black', 'red', 'blue'))

  dev.off()