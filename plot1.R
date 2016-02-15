##Read Data##
weekonedata<-read.table("household_power_consumption.txt", sep=";", header=TRUE)
##Fix Date format##
weekonedata$Date<-as.Date(weekonedata$Date, format = "%d/%m/%Y")
##Subset Dataframe##
Date1<-as.Date("2007-02-01")
Date2<-as.Date("2007-02-02")
AnalysisDateRange<-weekonedata[weekonedata$Date >=Date1 & weekonedata$Date<=Date2,]

##Plot 1##
##First, fix format of Global_active_power)
AnalysisDateRange$Global_active_power<-as.numeric(paste(AnalysisDateRange$Global_active_power))
##Create histogram##
plot1<-hist(AnalysisDateRange$Global_active_power, breaks=15, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
##Create File##
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
