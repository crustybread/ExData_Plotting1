library(data.table)
library(plyr)
rm(list=ls())
setwd("~/documents/exploratory_data_analysis")

#Initialize data
Sys.setlocale("LC_TIME", "en_US.UTF-8")
hpc <- read.table("household_power_consumption.txt", header= T, sep=";", na.strings = "NA", stringsAsFactors = F)
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
hpc <- arrange(hpc, hpc$Date)
hpc <- subset(hpc, hpc$Date >= "2007/02/01" & hpc$Date <= "2007/02/02")
str(hpc); head(hpc,20); tail(hpc,20)

#construct plot and display on screen device
plot2 <- function() {
  x <- c("Thu", "Fri", "Sat")
  y <- c(0,1475,2900)
  plot(hpc$Global_active_power,type="s", xaxt = "n", ylab = "Global Active Power (kilowatts)")
  axis(1, at = y, labels = x)
}
plot2()


#write png
png(filename="Plot2.png", width = 480, height = 480)
plot2()
dev.off()
