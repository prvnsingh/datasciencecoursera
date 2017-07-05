#setting working directory
setwd("C:\\Users\\ppga\\Documents\\GitHub\\datasciencecoursera\\Exploratory_Data")

#loading data in R
data <- read.csv("household_power_consumption.txt", sep = ";")

#subsetting Data 
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

#screening device
png("plot1.png", width=480, height=480)

#plotting
hist(as.numeric(subdata$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Acitve Power")

#closing screen device
dev.off()
