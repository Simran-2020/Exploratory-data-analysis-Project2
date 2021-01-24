library(dplyr)
library(ggplot2)

NEI <- readRDS("C:/Users/dell/Documents/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/dell/Documents/Source_Classification_Code.rds")

#Question: Across the United States, how have emissions from coal 
#combustion-related sources changed from 1999–2008?

coal_SCCs <- SCC %>%
    filter(grepl("coal", EI.Sector, ignore.case=TRUE)) %>%
    select(SCC)

coal_summary <- NEI %>%
    filter(SCC %in% coal_SCCs$SCC) %>%
    group_by(year) %>%
    summarize(total_emissions = sum(Emissions))

coal_summary$year <- as.factor(coal_summary$year)

#plot4.png

ggplot(coal_summary, aes(x=year, y=total_emissions)) + geom_bar(stat="identity") + labs(x="Year", y="Coal Emission") + ggtitle("US Emissions from Coal Related Sources")

#AnswerFrom the graph we observe that the emissions across the US 
#from coal combustion related sources has decreased from 1999 to 2008.




