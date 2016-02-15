##Read Data##
weekonedata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
##Fix Date format##
weekonedata$DateTime = paste(weekonedata$Date, weekonedata$Time, sep=" ")
weekonedata$DateTimeFixed = as.POSIXct(weekonedata$DateTime,format="%d/%m/%Y %H:%M:%S")
##Subset Dataframe##
weekonedata$Date<-as.Date(weekonedata$Date, format = "%d/%m/%Y")
Date1<-as.Date("2007-02-01")
Date2<-as.Date("2007-02-02")
AnalysisDateRange<-weekonedata[weekonedata$Date >=Date1 & weekonedata$Date<=Date2,]
##Plot 2##
##First, fix format of Global_active_power)
AnalysisDateRange$Global_active_power<-as.numeric(paste(AnalysisDateRange$Global_active_power))
##Plot Graph##
x<-AnalysisDateRange$Global_active_power
y<-AnalysisDateRange$DateTimeFixed
plot(y,x, type="l", ylab="Global Active Power (kilowatts)", xlab=" ")
##Create File##
dev.copy(png, file="plot2.png", heigh=480, width=480)
dev.off()