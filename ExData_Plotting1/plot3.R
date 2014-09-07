# Program to draw Energy sub meterings

# Read file
  eps = read.table("household_power_consumption.txt",sep=";",header = T,stringsAsFactors = F,na.strings = "?")
# convert to date
  eps$Date2 <- as.Date(eps$Date,format="%d/%m/%Y")
# filter only period needed
  eps <- eps[eps$Date2 >= as.Date('2007-02-01',format="%Y-%m-%d") & eps$Date2 <= as.Date('2007-02-02',format="%Y-%m-%d"),]
# convertion of time
  eps$Fhora <- strptime(paste(eps$Date, eps$Time),format="%d/%m/%Y %H:%M:%S")

# output to file
    png(filename = "Plot_3.png", width = 480, height = 480)

# Plot 3
    plot(eps$Fhora, eps$Sub_metering_1, type = "l", ylab = "Energy sub metering",xlab = "")
    lines(eps$Fhora, eps$Sub_metering_2,col = "red")
    lines(eps$Fhora, eps$Sub_metering_3,col = "blue")
    legend("topright", lty = 1, col = c("black","blue", "red"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()  ## Close the PDF file device