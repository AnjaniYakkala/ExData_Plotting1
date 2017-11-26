##Read the data from the Household power consumption file only the rows for two days in Feb 

k<-read.table('household_power_consumption.txt',skip=66637,nrows=2880,header=FALSE,sep=';',stringsAsFactors=FALSE)
##Read the heders related to the household power consumption data 

header<-read.table('household_power_consumption.txt',nrows=1,header=FALSE,sep=';',stringsAsFactors=FALSE)
##Assign the colnames to the object K which has the data for two days

colnames(k)<-unlist(header)
##create a object h which is combination of Date and Time from the object k above
h<-paste(k$Date,k$Time)
## convert h to date and time format, lubridate package required.commands install.packages("lubridate") and library(lubridate)
l<-dmy_hms(h)
##bind the l with the K as a new column, the new column has the data and time together

kl<-cbind(k,l)

##Plot in png, with pixels of 480

png("plot4.png",width=480,height=480)
##set 2 rows and 2 columns format to draw four graphs
par(mfrow=c(2,2))
with(kl,plot(l,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
with(kl,plot(l,Voltage,type="l",xlab="datetime",ylab="Voltage"))
with(kl,plot(l,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",col="black"))
lines(kl$l,kl$Sub_metering_2,col="red")
lines(kl$l,kl$Sub_metering_3,col="blue")
legend("topright",legend=(c("Sub_metering_1","Sub_metering_2","Sub_metering_3")),lwd=c(2,2,2),col=c("black","red","blue"))
with(kl,plot(l,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()

