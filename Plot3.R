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
plot3 <- function() {
  x <- c("Thu", "Fri", "Sat")
  y <- c(0,1475,2900)
  plot(hpc$Sub_metering_1, type="s", xaxt = "n", ylab = "Energy sub metering", col="black")
  lines(hpc$Sub_metering_2, type="s", xaxt ="n", col="red")
  lines(hpc$Sub_metering_3, type="s", xaxt ="n", col="blue")
  axis(1, at = y, labels = x)
  legend("topright", inset=0, c("Sub metering 1","Sub metering 2","Sub metering 3"), cex = 0.7, text.width = 875, lty=c(1,1,1), lwd=c(2,2,2), col=c("black","red","blue"))
}
plot3()

#write png
png(filename="Plot3.png", width = 480, height = 480)
plot3()
dev.off()
