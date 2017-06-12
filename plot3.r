importData <- function(){
  pwr_raw <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = c("?", "NA"))
  pwr <- subset(pwr_raw, grepl("^[1-2]/(0)?2/2007",pwr_raw$Date))
  Datetime <- paste(pwr$Date, pwr$Time, sep=" ")
  pwr$Date<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
  return(pwr)
}

plot3 <- function(){
  plot(pwr$Date, pwr$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = "")
  lines(pwr$Date, pwr$Sub_metering_2, type = "l", col = "red")
  lines(pwr$Date, pwr$Sub_metering_3, type = "l", col = "blue")
  legend(x="topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty =c(1,1,1), col=c("black","blue","red"))
  dev.copy(png, "plot3.png")
  dev.off()
}