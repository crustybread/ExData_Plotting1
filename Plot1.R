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

#construct plot
plot1 <- function() {
  x <- c("Thu", "Fri", "Sat")
  y <- c(0,1475,2900)
  hist(hpc$Global_active_power, breaks = 20, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red", xaxt = "n")
  axis(1, at = seq(0, 6, by = 2))
}
plot1()

#write png
png(filename="Plot1.png", width = 480, height = 480)
plot1()
dev.off()
