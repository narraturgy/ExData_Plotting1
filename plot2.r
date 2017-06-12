importData <- function(){
  pwr_raw <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = c("?", "NA"))
  pwr <- subset(pwr_raw, grepl("^[1-2]/(0)?2/2007",pwr_raw$Date))
  Datetime <- paste(pwr$Date, pwr$Time, sep=" ")
  pwr$Date<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
  return(pwr)
}

plot2 <- function(){
  plot(pwr$Date, pwr$Global_active_power, type = "l", ylab = "Global Active Power(kilowatts)", xlab ="")
  dev.copy(png, "plot2.png")
  dev.off()
}