dataframe <- read.table("household_power_consumption.txt",header=TRUE,sep=";")
Date2 <- as.Date(dataframe$Date,format="%d/%m/%Y”)

dataframe <- transform(dataframe,Date=as.Date(dataframe$Date,format="%d/%m/%Y"),DateTime=as.POSIXct(paste(Date2,dataframe$Time),format="%Y-%m-%d %H:%M:%S"),Sub_metering_1=as.numeric(as.character(dataframe$Sub_metering_1)),Sub_metering_2=as.numeric(as.character(dataframe$Sub_metering_2)),Sub_metering_3=as.numeric(as.character(dataframe$Sub_metering_3)))

dataframe2 <- subset.data.frame(dataframe,Date=="2007-02-01" | Date=="2007-02-02”)

png(“Plot3.png",width = 480, height = 480, units = "px")

with(dataframe2,plot(dataframe2$DateTime,dataframe2$Sub_metering_1,xlab="",ylab = "Energy sub metering",type="n"))
lines(dataframe2$DateTime,dataframe2$Sub_metering_1, col="Black”)
lines(dataframe2$DateTime,dataframe2$Sub_metering_2, col="Red”)
lines(dataframe2$DateTime,dataframe2$Sub_metering_3, col="Blue”)
legend("topright",lty=1,col = c("Black","Red","Blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3”))

dev.off()
