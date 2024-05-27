library(ggplot2)
library(dplyr)
library(maps)
library(ggmap)

# Load dataset
new_data <- read.csv("incarceration_trends.csv")

# Filtering for the races being compared and state (California)
filtering_data_map <- new_data %>% 
  filter(state == "WA") %>% 
  select("state","county_name", "latinx_jail_pop")


max_black_jail_pop <- max(filtering_data_map$latinx_jail_pop, na.rm = TRUE)


ca_shape <- map_data('county', 'washington')

# Joining shape data with population data
state_shape <- left_join(ca_shape, filtering_data_map, by = c("subregion" = "county_name"))

# Plotting
ggplot(state_shape, aes(x = long, y = lat, group = group, fill = latinx_jail_pop)) +
  geom_polygon(color = "black", size = 0.1) +
  coord_map() +
  scale_fill_gradientn(colours = c("green", "darkgreen"), na.value = "skyblue", limits = c(0, max_black_jail_pop)) +
  labs(fill = "Latinx Jail Population",
       title = "Distribution of Latinx Jail Population in Washington State") +
  theme_void() 

