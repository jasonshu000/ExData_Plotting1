a <- read.csv("household_power_consumption.txt",sep=";")
a$Date <- as.Date(a$Date,format="%d/%m/%Y")
b <- subset(a, Date == "2007-02-01" | Date == "2007-02-02")
b[,3] <- as.numeric(as.character(b[,3]))
b$DateTime <- strptime(paste(b$Date,b$Time), format="%Y-%m-%d %H:%M:%S")
png(filename="plot2.png", width=480, height=480)
plot(b$DateTime,b[,3], type="n", xlab="", ylab="Global Active Power (kilowatts)")
lines(b$DateTime,b[,3])
dev.off()