# Program to draw Global Active Power

# Read file
  eps = read.table("household_power_consumption.txt",sep=";",header = T,stringsAsFactors = F,na.strings = "?")
# convert to date
  eps$Date2 <- as.Date(eps$Date,format="%d/%m/%Y")
# filter only period needed
  eps <- eps[eps$Date2 >= as.Date('2007-02-01',format="%Y-%m-%d") & eps$Date2 <= as.Date('2007-02-02',format="%Y-%m-%d"),]
# convertion of time
  eps$Fhora <- strptime(paste(eps$Date, eps$Time),format="%d/%m/%Y %H:%M:%S")


# output to ping file
    png(filename = "Plot_2.png", width = 480, height = 480)
# Plot 2
     plot(eps$Fhora,eps$Global_active_power, type = "l", ylab= "Global Active Power (kilowatts)", xlab = "")

dev.off()  ## Close the PDF file device
