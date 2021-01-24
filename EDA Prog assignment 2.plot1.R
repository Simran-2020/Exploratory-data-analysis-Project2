
library(dplyr)
library(ggplot2)


NEI <- readRDS("C:/Users/dell/Documents/summarySCC_PM25.rds")
head(NEI)
SCC <- readRDS("C:/Users/dell/Documents/Source_Classification_Code.rds")
head(SCC)

#Question 1: Have total emissions from PM2.5 decreased in the United 
#States from 1999 to 2008? Using the base plotting system, make a plot 
#showing the total PM2.5 emission from all sources for each of the years 
#1999, 2002, 2005, and 2008.


#plot1.png
total_emmissions <- aggregate(Emissions ~ year, NEI, sum)
cols <- c("red", "blue", "green", "yellow")
barplot(height=total_emmissions$Emissions/1000, names.arg=total_emmissions$year, xlab="Year", ylab=expression('Total Emission'),main=expression('Total PM'[2.5]*' Emmissions by Year'), col = cols)

#Answer: From the barplot we observe that the total PM2.5 emissions 
#across the United States has decreased from 1999 to 2008. The total 
#emissions is stable from 2002 to 2005 but decreased from 2005-2008.




