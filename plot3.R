## reading and subsetting data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)
good1 <- complete.cases(data)
complete.data <- data[good1,]
x <- as.Date(complete.data$Date, "%d/%m/%Y")
good2 <- (x >= as.Date("2007-02-01", "%Y-%m-%d") & x <= as.Date("2007-02-02", "%Y-%m-%d"))
tidy.data <- complete.data[good2, ]

## drawing the plot
par(mfrow = c(1, 1), family = "serif")
time <- strptime(paste(tidy.data$Date, tidy.data$Time), "%d/%m/%Y %H:%M:%S")
plot(x= time, y= tidy.data$Sub_metering_1, type = "n", xlab = "", 
     ylab = "Energy sub metering", font.lab = 1, font.main = 1, font.axis = 1)
points(x= time, y= tidy.data$Sub_metering_1, type = "l", col = "black", 
       xlab = "", ylab = "Energy sub metering", font.lab = 1, font.main = 1, font.axis = 1)
points(x= time, y= tidy.data$Sub_metering_2, type = "l", col = "red", 
       xlab = "", ylab = "Energy sub metering", font.lab = 1, font.main = 1, font.axis = 1)
points(x= time, y= tidy.data$Sub_metering_3, type = "l", col = "blue", 
       xlab = "", ylab = "Energy sub metering", font.lab = 1, font.main = 1, font.axis = 1)
legend(x = strptime("2007-02-02 18:35:00", "%Y-%m-%d %H:%M:%S"), y = 36,  lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1      ", "Sub_metering_2      ", "Sub_metering_3      "),
       xjust = 0.5, yjust = 0.5, cex = 0.7, y.intersp = 0.7)

## making the png file
dev.copy(png, file = "plot3.png")
dev.off()