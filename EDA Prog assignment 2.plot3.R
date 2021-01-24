library(dplyr)
library(ggplot2)

NEI <- readRDS("C:/Users/dell/Documents/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/dell/Documents/Source_Classification_Code.rds")

#Question: Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, which of these four 
#sources have seen decreases in emissions from 1999–2008 for Baltimore 
#City? Which have seen increases in emissions from 1999–2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

baltimary <- subset(NEI, fips=="24510")
baltimary$year <- as.factor(baltimary$year)
baltimoreyearly <- aggregate(Emissions ~ year+type, baltimary, sum)

#plot3.png
graph<-ggplot(data=baltimoreyearly, aes(fill = type, y=Emissions, x=year)) + 
  geom_bar(stat="identity") +
  facet_grid(~type) +
  xlab("year") +
  ylab('Total Emissions') +
  ggtitle(' Baltimore Emissions From 1999 to 2008')
print(graph)


#Answer:From the graph we observe that the emissions from non-road, 
#non-point, and on-road sources all  decrease from 1999 to 2008. 
#whereas  emissions increased  from the point source.


