## reading and subsetting data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
good1 <- complete.cases(data)
complete.data <- data[good1,]
x <- as.Date(complete.data$Date, "%d/%m/%Y")
good2 <- (x >= as.Date("2007-02-01", "%Y-%m-%d") & x <= as.Date("2007-02-02", "%Y-%m-%d"))
tidy.data <- complete.data[good2, ]

## drawing the plot
par(mfrow = c(1,1), family = "serif")
hist(tidy.data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", font.lab = 1, main = "Global Active Power", font.main = 1, font.axis = 1)

## making the png file
dev.copy(png, file = "plot1.png")
dev.off()
