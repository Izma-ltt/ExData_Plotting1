plot4 = function( file = "household_power_consumption.txt" ){
    dataSQL <- read.csv.sql( file,
                             sql = "select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",
                             sep = ";" )
    datetime <- as.POSIXct( paste( dataSQL$Date, dataSQL$Time ), format = "%d/%m/%Y %H:%M:%S")
    
    png( filename = "plot4.png", width = 480, height = 480 )
    
    par( mfrow = c( 2, 2 ) )
    
    plot( datetime, dataSQL$Global_active_power, type = "l", xlab ="",
          ylab = "Global Active Power" )
    
    plot( datetime, dataSQL$Voltage, type = "l", ylab = "Voltage" )
    
    plot(  datetime, dataSQL$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering" )
    lines( datetime, dataSQL$Sub_metering_2, col = "red", type = "l")
    lines( datetime, dataSQL$Sub_metering_3, col = "blue", type = "l")
    legend( "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
            lty = 1, bty = "n", col = c("black", "red", "blue") )
    
    plot( datetime, dataSQL$Global_reactive_power , type = "l",
          ylab = "Global_Reactive_Power" )

    dev.off()
    }