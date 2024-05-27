library(ggplot2)
library(dplyr)

# Load dataset
new_data <- read.csv("incarceration_trends.csv")

# Filtered data for different races prison population over these years 
years_filtered <- subset(new_data, year %in% c("2000", "2005", "2010", "2015"))

# Filtering for the races being compared
states_filtered <- subset(years_filtered, state %in% c("TX", "CA", "WA"))

# Select relevant columns
all_filtered_three <- select(states_filtered, "year", "state", "female_prison_adm_rate", "male_prison_adm_rate")

# Convert year to factor for correct ordering
all_filtered_three$year <- factor(all_filtered_three$year)

# Create line chart
ggplot(all_filtered_three, aes(x = year)) +
  geom_line(aes(y = female_prison_adm_rate, color = "Female Jail Admissions"), na.rm = TRUE) +
  geom_line(aes(y = male_prison_adm_rate, color = "Male Jail Admissions"), na.rm = TRUE) +
  labs(title = "Trend of Female and Male Jail Admissions Over Time",
       x = "Year",
       y = "Admission Rate",
       color = "Category") +
  scale_color_manual(values = c("Female Jail Admissions" = "red", "Male Jail Admissions" = "blue")) +
  theme_minimal()
