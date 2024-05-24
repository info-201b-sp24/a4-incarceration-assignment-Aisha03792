
# add important code 
library(ggplot2)
library(dplyr)

# load dataset

trends_over_time <- read.csv("incarceration_trends_jail_jurisdiction.csv")


# Filtered data for difference races prison population over these years 
years_filtered <- subset(trends_over_time, year %in% c("2000", "2005", "2010","2015"))

# Filtering for the races being compared!
races_filtered <- select(years_filtered, c("year","black_jail_pop","latinx_jail_pop"))

# work site
ggplot(data = races_filtered, aes(
  x = year, 
  y = black_jail_pop,
  fill = year)) +
  geom_bar(stat = "identity") + 
  labs(y = "Total Population ranges", 
       x = "Years",
       fill = "Years Observed") +
  ggtitle("The Difference between Black and Latinx Jail Population over the years!")


# Bar Chart
ggplot(data = races_filtered, aes(x = year)) +
  geom_bar(aes(y = black_jail_pop, fill = "Black population"), stat = "identity") + 
  geom_bar(aes(y = latinx_jail_pop, fill = "Latinx population"), stat = "identity") + 
  labs(y = "Jail Population ranges", 
       x = "Years",
       fill = "Over the Years") +
  ggtitle("The Difference between Black and Latinx Jail Population over the years!")


