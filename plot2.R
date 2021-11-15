require(dplyr)
require(tidyr)
require(lubridate)

setwd('./R/Data Science Class/data viz class')
# file location 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'

# *** Read in data file and filter subset to Feb 1 and 2 ***
epower <- read.table('household_power_consumption.txt', header = T, sep = ';', na.strings = '?')
epower$dt <- dmy_hms(paste0(epower$Date, epower$Time))

epowFeb <- epower %>% filter(dt >= as.Date('2007-02-01') & dt < as.Date('2007-02-03'))

# *** create and save plot2 ***
  png(filename = 'plot2.png',
      width = 480,
      height = 480,
      units = 'px')
  with(epowFeb, plot(dt, Global_active_power, type = 'l', ylab = 'Global Active Power (kilowatts)'))

  dev.off()