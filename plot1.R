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

# Graph 1

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12,
    bg = "white",  res = NA,
    type =  "quartz")


with(datos,{
    hist(Global_active_power, col = "red",main="Global Active Power", xlab="Global Active Power (kilowatts)")})


dev.off()