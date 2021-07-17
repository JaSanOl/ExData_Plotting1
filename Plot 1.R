### Script for making the first plot in the week 1 assignment
### Exploratory Data Analysis Course (Coursera)

### We set the working directory and read in the data

setwd("C:/Users/javie/OneDrive/Documents/Coursera/Exploratory Data Analysis")
data <- read.table(file = "household_power_consumption.txt", sep = ";" ,
                   dec = ".", header = T)

### We extract the data from the dates 01/02/2007 & 02/02/2007

Format_Date <- as.Date(data$Date, format = "%d/%m/%Y")
Date_frmt <- format(Format_Date, "%Y-%m-%d")

head(Date_frmt)

### Subsetting the Data just for these two dates

data$Date <- Date_frmt

Target_data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]

### We create plot 1

Target_Power <- as.numeric(Target_data$Global_active_power)/1000

hist(Target_Power, col = "red", xlim = c(0,4),
     xlab = "Global Active Power(kilowatts)",
    ylab = "Frequency", main = "Global Active Power")

#### We save the plot into a png file

dev.copy(png, "Plot1.png")

dev.off()