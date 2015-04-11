plot1<-function(){
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
  png("plot1.png")
  hist(data$Global_active_power,xlab="Global Active Power(Kilowatts)",main = "Global Active Power",col="red")
  dev.off()
}