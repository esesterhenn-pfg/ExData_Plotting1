library(dplyr)
consumption_data = read.table("exdata_data_household_power_consumption/household_power_consumption.txt",header = TRUE,sep = ";")
filter_data = consumption_data %>% filter(Date == "1/2/2007"|Date == "2/2/2007")
filter_data$Date = as.Date(filter_data$Date, format = "%d/%m/%Y")
filter_data$Time = strptime(filter_data$Time, format = "%H:%M:%S")
filter_data[1:1440,"Time"] = format(filter_data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
filter_data[1441:2880,"Time"] = format(filter_data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

png("plot2.png", width = 480, height = 480)
plot(filter_data$Time, as.numeric(filter_data$Global_active_power),type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
