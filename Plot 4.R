### Script for making the fourth plot in the Week 1 Assignment
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

### Combining Date and Time to create a variable of class POSIXct

Date_time <- paste(Target_data$Date, Target_data$Time, sep = " ")

Date_time <- as.POSIXct(Date_time, format = "%Y-%m-%d %H:%M:%S")

Target_Power <- as.numeric(Target_data$Global_active_power)/1000

Target_data <- cbind(Date_time, Target_data)

### Creating Plot 4

### First we create the matrix 2x2 where we will put our 4 plots

par(mfcol = c(2,2))

### We first create the plot on the top left

plot(x= Target_data$Date_time, y = Target_Power , type = "l",
     ylab = "Global active Power (in kilowatts)")


### Then we go on to create the one bottom left

plot(x = Target_data$Date_time, y =    Target_data$Sub_metering_1,
     col = "black", type = "l", ylab = "Energy sub metering")

lines(x = Target_data$Date_time, y =  Target_data$Sub_metering_2,
      type = "l", col = "red")

lines(x = Target_data$Date_time, y =  Target_data$Sub_metering_3,
      type = "l", col = "blue")

#### Finally we make the legend and add it to the plot

legend_text <- c("Sub metering 1", "Sub metering 2", "Sub metering 3")

legend("topright",  legend = legend_text, col = c(1, 2, 4), 
       cex = 0.6, text.font = 2, y.intersp = 0.3, bty = "n",lty = 1, lwd = 2)


### Now we create our third plot top right which describes the voltage

plot(x = Target_data$Date_time, y = Target_data$Voltage,
     xlab = "date-time", ylab = "Voltage", type = "l", lwd = 1)


### We end up our analysis with the reactive power which will go bottom right


plot(x = Target_data$Date_time, y = Target_data$Global_reactive_power,
     xlab = "date-time", ylab = "Global reactive power", type = "l", lwd = 1)

### WE save our work into a png File

dev.copy(png, "Plot4.png")


dev.off()