# Program to draw histogram of Global Active Power

# Read file
  eps = read.table("household_power_consumption.txt",sep=";",header = T,stringsAsFactors = F,na.strings = "?")
# convert to date
  eps$Date2 <- as.Date(eps$Date,format="%d/%m/%Y")
# filter only period needed
  eps <- eps[eps$Date2 >= as.Date('2007-02-01',format="%Y-%m-%d") & eps$Date2 <= as.Date('2007-02-02',format="%Y-%m-%d"),]
# convertion of time
  eps$Fhora <- strptime(paste(eps$Date, eps$Time),format="%d/%m/%Y %H:%M:%S")

# Output to png file
  png(filename = "Plot_1.png", width = 480, height = 480)

# plot 1
  hist(eps$Global_active_power, col = "red", main = "Global Active Power",xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

dev.off()  ## Close the PDF file device