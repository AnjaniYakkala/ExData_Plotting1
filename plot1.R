##Read only the data related to the two days "2007-02-01 and 2007-02-02". For this at first read
##two lines from the data set (Household Consumption provided in the Quiz). Print the two lines and 
##see the header and the first line. The file starts at 16/12/2006 17:24:00. Calculate the time in 
##minutes from this date to 1/2/2007. It is 66636 minutes, add one more to account for the header, 
## then it is 66637, skip these lines and read the data. Again we have to read the data for two days only
## that is 2 days times 60 minutes times 24 hours, that comes to 2880

## Below line reads the data for the two lines
HouseHoldConsumption<-read.table('household_power_consumption.txt',skip=66637,nrows=2880,header=FALSE,sep=';',stringsAsFactors=FALSE)

##Read the headers from the file and assign them as colnames to the header 
header<-read.table('household_power_consumption.txt',nrows=1,header=FALSE,sep=';',stringsAsFactors=FALSE)
colnames(HouseHoldConsumption)<-unlist(header)
##convert Date and Time variables to Dates and Time using Lubridate Package commnands, Lubridate package
##needs to be installed and also load Lubridate Library, commands install.packages("lubridate") and library(lubridate)
HouseHoldConsumption$Date<-dmy(HouseHoldConsumption$Date)
HouseHoldConsumption$Time<-hms(HouseHoldConsumption$Time)
##Below draws the histogram that is Plot 1 and saves in png file of width and height 480 pixels
png("plot1.png",width=480,height=480)
hist(HouseHoldConsumption$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

