setwd("~/Documents/R wd/rexpdata/project 1")

# Reading the file

datos<-read.table(file="household_power_consumption.txt", header=T,sep=";",
                  dec=".",stringsAsFactors=F,na.strings="?")

# Creating datetime variable

datos<-within(datos,{
    datetime<-strptime(paste(datos$Date, datos$Time), "%d/%m/%Y %H:%M:%S")})

# Subseting as per dates

datos<-subset(datos, as.Date(datetime)>= as.Date("2007-02-01") &
                                         as.Date(datetime)<= as.Date("2007-02-02"))

# Graph 3

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type =  "quartz")


with(datos,{
    
    plot(datetime, Sub_metering_1, type="l", ylab="Energy sub metering", xlab= "")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col= "blue")
    legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
           ,lwd=1, lty=c(1,1,1), pch=c(NA,NA,NA),col=c("black", "red", "blue")
           )
            }
    )



dev.off()