setwd("C:\\Users\\ppga\\Documents\\R")
nei <- readRDS("SummarySCC_PM25.rds")
scc <- readRDS("Source_Classification_code.rds")

n <- aggregate(Emissions~year,nei,sum)
png("plot1.png")
barplot(n$Emissions/1000,col= n$year, names.arg = n$year, xlab = "year", ylab = "Total Emissions", ylim = c(0,10000), main = "Total PM'[2.5]*' emissions at various years in kilotons")
dev.off()



baltimore <-subset(nei,fips == "24510")
baltimore <- aggregate(Emissions~year,baltimore,sum)
png ("plot2.png")
barplot(baltimore$Emissions,col = baltimore$year, names.arg = baltimore$year, ylim = c(0,4000), xlab = "year", ylab = "Total Emissions", main = "total emissions in the  Baltimore City")
dev.off()


library(ggplot2)
baltimore <-subset(nei,fips == "24510")
b<- aggregate(Emissions~year+type,baltimore,sum)
png("plot3.png")
qplot(year,Emissions,data = b, col  = type,geom = "line")
dev.off()

n<-grepl(("[coal]$"),scc$EI.Sector)
scc.coal <- scc[n,]
nei.coal <- nei[nei$SCC %in% scc.coal$SCC, ]
nei.coal.emissions<- aggregate(Emissions~year,nei.coal,sum)
png("plot4.png")
qplot(year,Emissions,data = nei.coal.emissions)
dev.off()

library(ggplot2)
png("plot5.png")
baltimore <-subset(nei,fips == "24510"& type =="ON-ROAD")
baltimore <- aggregate(Emissions~year,baltimore,sum)
qplot(year,Emissions,data = baltimore,geom = "line", main = "emissions from motor vehicle sources changed from 1999-2008 in Baltimore City")
dev.off()


png("plot6.png")
LA_balt <- subset(nei,(fips =="06037"|fips =="24510")& type == "ON-ROAD")
LA_balt <- aggregate(Emissions~year+fips,LA_balt,sum)
qplot(year,Emissions,data = LA_balt,geom = "line", col = fips,main = "Motor Vehicle Emissions in Baltimore (24510) \nvs. Los Angeles (06037) Counties")
dev.off()