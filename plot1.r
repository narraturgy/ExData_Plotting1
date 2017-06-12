importData <- function(){
  pwr_raw <- read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = c("?", "NA"))
  pwr <- subset(pwr_raw, grepl("^[1-2]/(0)?2/2007",pwr_raw$Date))
  Datetime <- paste(pwr$Date, pwr$Time, sep=" ")
  pwr$Date<-strptime(Datetime, "%d/%m/%Y %H:%M:%S")
  return(pwr)
}

plot1 <- function(){
  hist(pwr$Global_active_power, freq = TRUE, breaks = 12, col = "orangered", main = "Global Active Power", xlab = "Global_active_power")
  dev.copy(png, "plot1.png")
  dev.off()
}