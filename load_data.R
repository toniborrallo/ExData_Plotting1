## This file is for loading the large dataset.

## Create directory "data" if not exists
if (!file.exists("data")) {
  dir.create("data")
}

## Download&unzip dataset if no exists
if (!file.exists("data/household_power_consumption.txt")) {
  if(!file.exists("data/household_power_consumption.zip")) {
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, destfile = "data/household_power_consumption.zip")
  }
  unzip(zipfile = "data/household_power_consumption.zip", exdir = "data")
}

# Load dataset
data <- read.table(file ="data/household_power_consumption.txt",
                   header = TRUE,
                   sep = ";",
                   colClasses = c("character", "character", rep("numeric",7)),
                   na = "?")

## Filter 2 days
filter <- data$Date == "1/2/2007" | data$Date == "2/2/2007"
data <- data[filter, ]

## Convert Date and Time columns to Date/Time classes 
## First we create a Date&Time column
date_time <- paste(data$Date, data$Time)
data$DateTime <- strptime(date_time, "%d/%m/%Y %H:%M:%S")

## Last assign correct labels to rownames 
rownames(data) <- 1:nrow(data)

## free memory
rm(list=c("filter","date_time"))
