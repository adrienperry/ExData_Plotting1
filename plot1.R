dataframe <- read.table("household_power_consumption.txt",header=TRUE,sep = ";”)

dataframe <- transform(dataframe,Date=as.Date(dataframe$Date,format="%d/%m/%Y"),Global_active_power=as.numeric(as.character(dataframe$Global_active_power)))

dataframe2 <- subset.data.frame(dataframe,Date=="2007-02-01" | Date=="2007-02-02”)

png("plot1.png",width = 480, height = 480, units = "px")

hist(dataframe2$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",col="Red")

dev.off()
