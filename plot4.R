plot4 <- function () {
        householdData <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?"), colClasses = c("character", "character", rep("numeric", 7)))
        householdData$Time <- strptime(paste(householdData$Date, householdData$Time), "%d/%m/%Y %H:%M:%S")
        householdData$Date <- as.Date(householdData$Date, format = "%d/%m/%Y")
        feb1_2007 <- as.Date("2007-02-01", format="%Y-%m-%d")
        feb2_2007 <- as.Date("2007-02-02", format="%Y-%m-%d")
        febHouseholdData <- householdData[which(householdData$Date >= feb1_2007 & householdData$Date <= feb2_2007),]
        
        # set up 2x2 
        par(mfrow = c(2,2))
        
        # first graph
        plot(febHouseholdData$Time, febHouseholdData$Global_active_power, type="l", xlab="", ylab = "Global Active Power")
        # second graph
        plot(febHouseholdData$Time, febHouseholdData$Voltage, type="l", xlab="datetime", ylab = "Voltage")
        # third graph
        plot(febHouseholdData$Time, febHouseholdData$Sub_metering_1, type="n", xlab="", ylab = "Energy sub meeting")
        legend("topright", legend = names(febHouseholdData[7:9]), col=c("black","red","blue"), lty=c(1), cex = 0.2, bty="n")
        points(febHouseholdData$Time, febHouseholdData$Sub_metering_1, type="l", col="black")
        points(febHouseholdData$Time, febHouseholdData$Sub_metering_2, type="l", col="red")
        points(febHouseholdData$Time, febHouseholdData$Sub_metering_3, type="l", col="blue")
        
        # fourth graph
        plot(febHouseholdData$Time, febHouseholdData$Global_reactive_power, type="l", xlab="datetime", ylab = "Global_reactive_power")
        
        dev.copy(png, file = "plot4.png", width = 480, height = 480)
        dev.off()
}