dataframe <- read.table("household_power_consumption.txt",header=TRUE,sep=";")

Date2 <- as.Date(dataframe$Date,format="%d/%m/%Y”)

dataframe <- transform(dataframe,Date=as.Date(dataframe$Date,format="%d/%m/%Y"),DateTime=as.POSIXct(paste(Date2, dataframe$Time), format="%Y-%m-%d %H:%M:%S"),Global_active_power=as.numeric(as.character(dataframe$Global_active_power)))

dataframe2 <- subset.data.frame(dataframe,Date=="2007-02-01" | Date=="2007-02-02”)

png(“Plot2.png",width = 480, height = 480, units = "px")

with(dataframe2, plot(dataframe2$DateTime,dataframe2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)”))

dev.off()
