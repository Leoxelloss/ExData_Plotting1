plot4<-function(){
  #read in the date file in the work directory
  household_power_consumption <- read.csv("household_power_consumption.txt", sep=";")
  #convert the date column to date value
  household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")
 #get the subset of date from the 2 days
  data <- subset(household_power_consumption,household_power_consumption$Date>="2007-02-01"&household_power_consumption$Date<="2007-02-02")
  #set data column as numeric
  data$Global_active_power<-as.numeric(data$Global_active_power)
 
  data$Date<-as.POSIXct(paste(data$Date,data$Time),sep=" ", format = "%Y-%m-%d %H:%M:%S")

  #plot the graph here
  png("plot4.png")
  par(mfrow=c(2,2))
  plot(data$Date,data$Global_active_power,ylab = "Global Active Power",xlab = "",type = "l",col="black")
  plot(data$Date,data$Voltage,ylab = "Voltage",xlab = "",type = "l",col="black")
  title(sub = "DateTime")
  plot(data$Date,data$Sub_metering_1,ylab = "Energy sub metering",xlab = "",type = "l",col="black")
  lines(data$Date,data$Sub_metering_2,col="red")
  lines(data$Date,data$Sub_metering_3,col="blue")
  legend("topright",
        lwd=1, 
        lty=1, 
        col = c("black", "red", "blue"), 
        legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   plot(data$Date,data$Global_reactive_power,ylab = "Global Reactive Power",xlab = "",type = "l",col="black")
   title(sub="DateTime")
   dev.off()
}