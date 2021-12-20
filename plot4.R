source("load_householdpc_data.R")
hpc <- load_hpc_data()

png(file = "./plots/plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

##  --------------
##  |   PLOT 1   |
##  --------------
with(hpc, plot(1:nrow(hpc), Global_active_power, type = "l", 
     xaxt = "n", xlab = "", ylab = "Global Active Power"))
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

##  --------------
##  |   PLOT 2   |
##  --------------
with(hpc, plot(1:nrow(hpc), Voltage, 
               type = "l", xaxt = "n", xlab = "datetime"))
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

##  --------------
##  |   PLOT 3   |
##  --------------
with(hpc, {
  plot(1:nrow(hpc), hpc$Sub_metering_1, type = "l", xaxt = "n",
       col = "black", xlab = "", ylab = "Energy sub metering")  
  lines(1:nrow(hpc), Sub_metering_2,  col = "red")
  lines(1:nrow(hpc), Sub_metering_3, col = "blue")
})

axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))
legend("topright", lty = c(1, 1, 1), col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##  --------------
##  |   PLOT 4   |
##  --------------
with(hpc, plot(1:nrow(hpc), Global_reactive_power, 
               type = "l", xaxt = "n", xlab = "datetime"))
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()
