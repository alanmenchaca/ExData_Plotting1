source("load_householdpc_data.R")
hpc <- load_hpc_data()

png(file = "./plots/plot1.png", width = 480, height = 480)

#par(mar = c(5, 4, 4, 1), oma = c(1, 1, 0, 0))
hist(hpc$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "Red")

dev.off()
