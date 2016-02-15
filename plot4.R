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

##Prep for 4 plots in one##
par(mfrow=c(2,2))


##Plot 4##
##First Plot##
AnalysisDateRange$Global_active_power<-as.numeric(paste(AnalysisDateRange$Global_active_power))
##Plot Graph##
plot(AnalysisDateRange$DateTimeFixed,AnalysisDateRange$Global_active_power, type="l", ylab="Global Active Power", xlab=" ")
##Second Plot##
##Fix Voltage##
AnalysisDateRange$Voltage<-as.numeric(paste(AnalysisDateRange$Voltage))
plot(AnalysisDateRange$DateTimeFixed,AnalysisDateRange$Voltage, type="l", ylab="Voltage", xlab="datetime")
##Third Plot##
##Fix format of Sub_metering)
AnalysisDateRange$Sub_metering_1<-as.numeric(paste(AnalysisDateRange$Sub_metering_1))
AnalysisDateRange$Sub_metering_2<-as.numeric(paste(AnalysisDateRange$Sub_metering_2))
AnalysisDateRange$Sub_metering_3<-as.numeric(paste(AnalysisDateRange$Sub_metering_3))
##Create Plot##
plot(AnalysisDateRange$DateTimeFixed, AnalysisDateRange$Sub_metering_1, type="n", ylab="Energy sub metering", xlab=" ")
##Add lines##
lines(AnalysisDateRange$DateTimeFixed, AnalysisDateRange$Sub_metering_1)
lines(AnalysisDateRange$DateTimeFixed, AnalysisDateRange$Sub_metering_3, col="blue")
lines(AnalysisDateRange$DateTimeFixed, AnalysisDateRange$Sub_metering_2, col="red")
##Add legend##
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c("black", "red", "blue"), bty="n", cex=0.8)
##Forth Plot##
##Fix Reactive Power##
AnalysisDateRange$Global_reactive_power<-as.numeric(paste(AnalysisDateRange$Global_reactive_power))
plot(AnalysisDateRange$DateTimeFixed,AnalysisDateRange$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
##create file##
dev.copy(png, file="plot4.png", heigh=480, width=480)
dev.off()


