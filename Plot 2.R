### Script for making the second plot in the week 1 assignment
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

### Creating plot 2


###First we join the date and time information

Date_time <- paste(Target_data$Date, Target_data$Time, sep = " ")

Date_time <- as.POSIXct(Date_time, format = "%Y-%m-%d %H:%M:%S")

Target_Power <- as.numeric(Target_data$Global_active_power)/1000

Target_data <- cbind(Date_time, Target_data)

plot(x= Target_data$Date_time, y = Target_Power , type = "l",
     ylab = "Global active Power (in kilowatts)")

#### We save the plot into a png file and turn the device off

dev.copy(png, "Plot2.png")

dev.off()