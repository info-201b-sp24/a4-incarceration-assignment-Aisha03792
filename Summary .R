library(dplyr)

# load data set
new_data <- read.csv("incarceration_trends.csv")


# 1A. What is the average value of black_jail_pop across all the counties (in 2005)?

average_value <- new_data %>% 
  filter(year == 2005) %>%
  summarize(black_jail_pop= mean(total_pop, na.rm = TRUE))
  

# 2B. Where is black_jail_pop the highest / lowest?

highest_value <- new_data %>%
  filter(year == 2005) %>%
  summarize(black_jail_pop = max(black_jail_pop, na.rm = TRUE))
  
lowest_value <- new_data %>%
  filter(year == 2005) %>%
  summarize(black_jail_pop = min(black_jail_pop, na.rm = TRUE))


# 3C. How much has black_jail_pop change over the last (5) years?


# 4D. What is the maximum value of black_jail_pop across all the states and which county does it belong to. 

max_value <- new_data %>%
  filter(!is.na(black_jail_pop)) %>%
  summarize(max_black_jail_pop = max(black_jail_pop))

county_max_value <- new_data %>%
  filter(black_jail_pop == max_value$max_black_jail_pop) %>%
  select(state, county_name, black_jail_pop)


# 5E. What is the average value of black_jail_pop for each state across all available years. 

average_state_year_value <- new_data %>% 
  group_by(state) %>%
  summarize(black_jail_pop= mean(total_pop, na.rm = TRUE))



