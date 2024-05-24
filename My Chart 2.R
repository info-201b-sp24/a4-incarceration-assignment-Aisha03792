
library(ggplot2)
library(dplyr)

# Assuming trends_over_time is already loaded

# Filtered data for difference races prison population over these years 
years_filtered <- subset(trends_over_time, year %in% c("2000", "2005", "2010", "2015"))

# Filtering for the races being compared!
races_filtered <- select(years_filtered, c("year", "black_jail_pop", "latinx_jail_pop"))

# Create a scatter plot with connected points
ggplot(data = races_filtered, aes(x = year, group = 1)) +
  geom_line(aes(y = black_jail_pop, color = "Black Jail Population")) +
  geom_point(aes(y = black_jail_pop, color = "Black Jail Population")) +
  geom_line(aes(y = latinx_jail_pop, color = "Latinx Jail Population")) +
  geom_point(aes(y = latinx_jail_pop, color = "Latinx Jail Population")) +
  labs(y = "Total Population ranges", 
       x = "Years",
       color = "Population") +
  ggtitle("Comparison of Black and Latinx Jail Population over the Years")


