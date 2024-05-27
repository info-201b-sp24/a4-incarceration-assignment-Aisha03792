library(ggplot2)
library(dplyr)

# Load dataset
new_data <- read.csv("incarceration_trends.csv")

# Filter data for specific years and states
years_filtered <- subset(new_data, year %in% c("2000", "2005", "2010", "2015"))

states_filtered <- subset(years_filtered, state %in% c("TX", "CA", "WA"))

# Select relevant columns
all_filtered_three <- select(states_filtered, "year", "state", "female_prison_adm_rate", "male_prison_adm_rate")

# Convert 'year' to a factor
all_filtered_three$year <- factor(all_filtered_three$year)

# Plot line chart
ggplot(all_filtered_three, aes(x = year)) +
  geom_line(aes(y = female_prison_adm_rate, color = "Female Jail Admissions"), na.rm = TRUE) +
  geom_line(aes(y = male_prison_adm_rate, color = "Male Jail Admissions"), na.rm = TRUE) +
  labs(title = "Trend of Female and Male Jail Admissions Over Time",
       x = "Year",
       y = "Admission Rate",
       color = "Category") +
  scale_color_manual(values = c("Male Jail Admissions" = "blue", "Female Jail Admissions" = "red")) + # Specify colors for the categories
  theme_minimal()

