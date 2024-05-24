
# add important code 
library(ggplot2)

# load dataset

trends_over_time <- read.csv("incarceration_trends_jail_jurisdiction.csv")

# Filtered data for black male prison population over these years 
hehe <- subset(trends_over_time, year %in% c("1990", "1995", "2000","2005", 
                                             "2010", "2015","2020"))

# work site
ggplot(data = hehe, aes(
  x = year, 
  y =  black_jail_pop_rate,
  color = state)) +
  geom_line(na.rm = FALSE) + 
  labs(y = "Black population", 
       x = "Years",
       color = "Population Group") +
  ggtitle("Black Population in jail across different states over time!")


