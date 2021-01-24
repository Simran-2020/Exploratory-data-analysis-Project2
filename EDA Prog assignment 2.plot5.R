
library(dplyr)
library(ggplot2)

NEI <- readRDS("C:/Users/dell/Documents/summarySCC_PM25.rds")

SCC <- readRDS("C:/Users/dell/Documents/Source_Classification_Code.rds")

#Question: How have emissions from motor vehicle sources changed from #1999–2008 in Baltimore City?

#plot5.png
graph <- ggplot(baltimoreyearly, aes(factor(year), Emissions))
graph <- graph + geom_bar(stat="identity") +
  xlab("year") +
  ylab('Total Emissions') +
  ggtitle('Baltimore Motor Vehicle Emissions From 1999 to 2008')
print(graph)

#Answer: From the graph we observe that emissions in Baltimore City
# for motor vehicle sources has  decreased from 1999 to 2008.

