plot1 = function( file = "household_power_consumption.txt"){
   dataSQL <- read.csv.sql( file,
                             sql = "select * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'",
                             sep = ";" )

   png( filename = "plot1.png",
        width = 480, height = 480 )
   hist   <- with( dataSQL, hist( Global_active_power, xlab = "Global Active Power (kilowatts)", 
                                  main = "Global Active Power", col = "red" ) )
   dev.off()  
   }