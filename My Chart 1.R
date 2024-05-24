# add important code 
library(ggplot2)
library(dplyr)

# load dataset

new_data <- read.csv("incarceration_trends.csv")

# Filtered data for difference races prison population over these years 
years_filtered <- subset(new_data, year %in% c("2000", "2005", "2010","2015"))

# Filtering for the races being compared!

states_filtered <- subset(years_filtered, state %in% c("TX", "CA", "WA"))
  
all_filtered <- select(states_filtered, c("year","state","black_jail_pop","latinx_jail_pop", "native_jail_pop"))

# work site
ggplot(data = states_filtered, aes(
  x = year, 
  group = state)) +
  geom_bar(aes(y = black_jail_pop, fill = "Black Jail Pop"), stat = "identity", position = "dodge") + 
  geom_bar(aes(y = latinx_jail_pop, fill = "Latinx Jail Pop"), stat = "identity", position = "dodge") +
  labs(y = "Total Population ranges", 
       x = "Years",
       fill = "Population") +
  ggtitle("Comparison of Black and Latinx Jail Population in Different States over the years!") +
  scale_fill_manual(values = c("Black Jail Pop" = "blue",
                               "Latinx Jail Pop" = "red"),
                    name = "Population",
                    breaks = c("Black Jail Pop", "Latinx Jail Pop")) +
  facet_wrap(~state)
