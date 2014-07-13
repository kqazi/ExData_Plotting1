plot1 <- function(){
        householdData <- read.table("./household_power_consumption.txt", header = TRUE, sep=";", na.strings = c("?"), colClasses = c("character", "character", rep("numeric", 7)))
        householdData$Date <- as.Date(householdData$Date, format = "%d/%m/%Y")
        feb1_2007 <- as.Date("2007-02-01")
        feb2_2007 <- as.Date("2007-02-02")
        febHouseholdData <- householdData[which(householdData$Date >= feb1_2007 & householdData$Date <= feb2_2007),]
        hist(febHouseholdData$Global_active_power, col = "red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.copy(png, file = "plot1.png", width = 480, height = 480)
        dev.off()
}
