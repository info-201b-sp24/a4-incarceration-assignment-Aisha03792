# add important code 
library(ggplot2)
library(dplyr)

# load dataset
new_data <- read.csv("incarceration_trends.csv")

# Filtered data for different races prison population over these years 
years_filtered <- subset(new_data, year %in% c("2000", "2005", "2010", "2015"))

# Filtering for the races being compared
states_filtered <- subset(years_filtered, state %in% c("TX", "CA", "WA"))

# Select relevant columns

all_filtered_twice <- select(states_filtered, c("year", "state", "male_adult_jail_pop"))


# Line chart
ggplot(data = all_filtered_twice, aes(x = year, y = male_adult_jail_pop, color = state)) +
  geom_line() +
  labs(y = "Prison Population",
       x = "years", 
       color = "States") +
  ggtitle("Male adult jail population Vs Female Adult jail population")

