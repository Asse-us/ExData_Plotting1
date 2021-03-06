
# first copy th link address from dataset provided in the course.
# (you can get the link by right click on the dataset: Electric power consumption) 
# and copy the link address

# Download Data File Archive
fileName <- "HH_Electric_consumption.zip"
if(! file.exists(fileName)) {
    fileurl="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileurl, destfile = fileName, method="curl")
}

# Extract Data File
unzip(zipfile=fileName)

list.files(getwd())

# hence the new file to be considered is "household_power_consumption.txt"

# Reading the extracted data set
unzipData<- read.csv("./household_power_consumption.txt", header=TRUE, sep=';', na.strings='?')

# Extract a subset of the data for the dates 2007-02-01 and 2007-02-02
FinalData <-unzipData[unzipData$Date %in% c("1/2/2007","2/2/2007"), ]

names(FinalData) # to see the names of the coloumn header

# Compute the timestamp field
datetime<- strptime(paste(FinalData$Date, FinalData$Time),"%d/%m/%Y %H:%M:%S" )

# plot the data and save as png
png("plot3.png", width = 480, height = 480)
plot( datetime, FinalData$Sub_metering_1, type = "l", xlab ="", 
      ylab = "Energy sub metering", col = 'black')
lines(datetime, FinalData$Sub_metering_2, col = "red")
lines(datetime, FinalData$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()
