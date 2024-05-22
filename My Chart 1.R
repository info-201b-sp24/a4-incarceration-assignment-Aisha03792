
library(ggplot2)

# Imported the data and it's location

prison_per_county_state <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Chart 1 is a line chart

prison_per_state <- prison_per_county_state %>% 
  group_by(state) %>%
  summarize(total_prison_pop = sum(total_pop))

  
  
