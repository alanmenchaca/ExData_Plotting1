download_hpc_data <- function() {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  data_file <- "./data/hpc_dataset.zip"
  
  if(!file.exists(data_file)){
    dir.create("data")
    download.file(fileUrl, destfile = data_file)
    unzip(data_file, exdir = "./data")
  }  
}

load_hpc_data <- function() {
  download_hpc_data()
  
  library(dplyr)
  library(lubridate)
  data_path <- "./data/household_power_consumption.txt"
  
  feature_names <- names(read.csv(data_path, sep = ";", nrows = 1))
  hpc <- read.csv(data_path, sep = ";", skip = 66636, nrows = 2880,
                  col.names = feature_names)
  
  hpc <- mutate(hpc, Time = hms(Time))
  hpc <- mutate(hpc, Date = dmy(Date))
  
  write.csv(hpc, "./data/household_power_consumption.csv")
  return(hpc)
}
