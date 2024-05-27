# add important code 
library(ggplot2)
library(dplyr)

# load dataset

new_data <- read.csv("incarceration_trends.csv")

# Filtered data for difference races prison population over these years 
years_filtered <- subset(new_data, year %in% c("2000", "2005", "2010","2015"))

# Filtering for the races being compared!

states_filtered <- subset(years_filtered, state %in% c("TX", "CA", "WA"))

all_filtered <- select(states_filtered, c("year","state","black_jail_pop"))
                     
#bar chart over time 
ggplot(all_filtered, aes(x = year, y = black_jail_pop, fill = state)) + 
  geom_bar(stat = "identity", position = "dodge", na.rm = FALSE) + 
  labs(x = "Year", 
       y = "Black Jail Population",
       title = "Black Jail Population Across Different States and Years!") + 
  theme_minimal()
