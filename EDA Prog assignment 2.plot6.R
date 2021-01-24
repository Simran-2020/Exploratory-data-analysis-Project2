
library(dplyr)
library(ggplot2)

NEI <- readRDS("C:/Users/dell/Documents/summarySCC_PM25.rds")

SCC <- readRDS("C:/Users/dell/Documents/Source_Classification_Code.rds")


#Question: Compare emissions from motor vehicle sources in Baltimore 
#City with emissions from motor vehicle sources in Los Angeles County,
#California (fips==”06037”). Which city has seen greater changes over
#time in motor vehicle emissions?


balti_cali <- NEI %>%
    filter(fips %in% c("24510", "06037") & type == "ON-ROAD") %>%
    group_by(year, fips) %>%
    summarize(total_emissions = sum(Emissions))

balti_cali$year <- as.factor(balti_cali$year)
balti_cali$county_name <- factor(balti_cali$fips, levels=c("06037", "24510"), labels=c("Los Angeles County", "Baltimore City")) 


#plot6.png
ggplot(balti_cali, aes(x=year, y=total_emissions)) + 
    geom_bar(stat="identity", aes(fill=county_name)) +
    labs(x="Year", y=" Total Emissions") +
    ggtitle("Motor Vehicle Emissions for Baltimore City and LA County") 

#Answer:From the graph after comparing the emissions related to motor 
#vehicle sources in Baltimore City Vs Los Angeles we observe that Los
#Angeles has not decreased motor vehicle emissions at all from 1999 to 
#2008 while Baltimore City decreased emissions.

