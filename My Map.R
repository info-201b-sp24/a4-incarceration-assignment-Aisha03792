library(ggplot2)
library(dplyr)
library(maps)

# Load dataset
new_data <- read.csv("incarceration_trends.csv")

# Filtering for the races being compared and state (California)
filtering_data <- new_data %>% 
  filter(state == "CA") %>% 
  select("state", "county_name", "latinx_jail_pop", "black_jail_pop")

# Calculate max black jail population

max_black_jail_pop <- max(filtering_data$black_jail_pop, na.rm = TRUE)

# Assuming you have the mapping data for California, replacing wa_shape with ca_shape

ca_shape <- map_data('county', 'california')

# Joining shape data with population data
state_shape <- left_join(ca_shape, filtering_data, by = c("subregion" = "county_name"))

# Plotting
ggplot(state_shape, aes(x = long, y = lat, group = group, fill = black_jail_pop)) +
  geom_polygon(color = "black", size = 0.1) +
  coord_map() +
  scale_fill_gradientn(colours = c("blue", "darkblue"), na.value = "lightblue", limits = c(0, max_black_jail_pop)) +
  labs(fill = "Black Jail Population",
       title = "Distribution of Black Jail Population in California Counties") +
  theme_void()



# Black prison population in California state's counties 
