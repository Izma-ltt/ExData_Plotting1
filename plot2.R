plot2 = function( file = "household_power_consumption.txt" ){
    dataSQL <- read.csv.sql( file,
                             sql = "select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",
                             sep = ";" )
    datetime <- as.POSIXct( paste( dataSQL$Date, dataSQL$Time ), format = "%d/%m/%Y %H:%M:%S")
    png( filename = "plot2.png",
         width = 480, height = 480 )
    plot( datetime, dataSQL$Global_active_power, type = "l", 
          xlab = "", ylab = "Global Active Power (kilowatts)" )
    dev.off()
}