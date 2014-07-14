plot2 <- function(){
        householdData <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?"), colClasses = c("character", "character", rep("numeric", 7)))
        householdData$Time <- strptime(paste(householdData$Date, householdData$Time), "%d/%m/%Y %H:%M:%S")
        householdData$Date <- as.Date(householdData$Date, format = "%d/%m/%Y")
        feb1_2007 <- as.Date("2007-02-01", format="%Y-%m-%d")
        feb2_2007 <- as.Date("2007-02-02", format="%Y-%m-%d")
        febHouseholdData <- householdData[which(householdData$Date >= feb1_2007 & householdData$Date <= feb2_2007),]
        with(febHouseholdData, plot(febHouseholdData$Time, febHouseholdData$Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))
        dev.copy(png, file = "plot2.png", width = 480, height = 480)
        dev.off()
}