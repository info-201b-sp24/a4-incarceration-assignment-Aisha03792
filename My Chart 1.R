
# add important code 
library(ggplot2)

# load dataset

trends_over_time <- read.csv("https://raw.githubusercontent.com/vera-institute/incarceration-trends/master/incarceration_trends.csv")

# Filtered data for black male prison population in California
hehe <- subset(trends_over_time, state %in% c("WA", "TX", "CA"))

filtered_data <- hehe[, c("year", "state", "aapi_pop_15to64", "black_pop_15to64", "native_pop_15to64", "latinx_pop_15to64")]


# work site
ggplot(data = filtered_data, aes(
  x = year, 
  y =  black_pop_15to64,
  color = state)) +
  geom_line(na.rm = FALSE) + 
  labs(y = "Black population", 
       x = "Years",
       color = "Population Group") +
  ggtitle("Black Population in jail across different states over time!")


