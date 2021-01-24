
NEI <- readRDS("C:/Users/dell/Documents/summarySCC_PM25.rds")

SCC <- readRDS("C:/Users/dell/Documents/Source_Classification_Code.rds")

#Question: Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips==”24510”) from 1999 to 2008? Use the base plotting system to make a plot answering this question.

# forming Baltimore data by subsetting NEI data set
baltimary <- subset(NEI,fips=="24510")

# Baltimore yearly emission data
baltimoreyear <- aggregate(Emissions ~ year, baltimary, sum)

# plot2.png
color <- c("red", "purple", "pink", "grey")
barplot(height=baltimoreyear$Emissions/1000, names.arg=baltimoreyear$year, xlab="Year", ylab=('Total Emission'),main=('PM 2.5 Emmissions for Baltimore City'), col = color)

#Answer: From the barplot we observe that the emissions in Baltimore City
#have decreased from 1999 to 2008



