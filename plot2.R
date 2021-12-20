source("load_householdpc_data.R")
hpc <- load_hpc_data()

png(file = "./plots/plot2.png", width = 480, height = 480)

#par(mar = c(2, 4, 2, 1), oma = c(2, 1, 1, 1))
plot(1:nrow(hpc), hpc$Global_active_power, type = "l", xaxt = "n", 
     xlab = "", ylab = "Global Active Power (kilowatts)")
axis(1, at = c(1, 1440, 2880), labels = c("Thu", "Fri", "Sat"))

dev.off()
