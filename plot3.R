plot3 = function( file = "household_power_consumption.txt" ){
    dataSQL <- read.csv.sql( file,
                             sql = "select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",
                             sep = ";" )
    datetime <- as.POSIXct( paste( dataSQL$Date, dataSQL$Time ), format = "%d/%m/%Y %H:%M:%S")
    
    png( filename = "plot3.png",
         width = 480, height = 480 )
    
    plot( datetime, dataSQL$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering" )
    lines( datetime, dataSQL$Sub_metering_2, col = "red", type = "l")
    lines( datetime, dataSQL$Sub_metering_3, col = "blue", type = "l")
    legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty = 1, col = c("black", "red", "blue") )
    
    dev.off()
}