library(ggplot2)
library(dplyr)
library(maps)

new_data <- read.csv("incarceration_trends.csv")

my_map_data<- new_data %>%
  filter(year == 2015) %>%
  mutate(stateFull = state.name[match(state, state.abb)]) 

state_shapes <- map_data("state") %>%
  mutate(stateFull = state.name[match(region, tolower(state.name))])


together_data <- left_join(state_shapes, my_map_data, by = "stateFull")

# Ploting my map
ggplot(together_data) +
  geom_polygon(
    mapping = aes(x = long, y = lat, group = group, fill = black_jail_pop_rate),
    color = "white",
    size = 0.1
  ) +
  coord_map() +
  scale_fill_continuous(low = "darkred", high = "darkblue") +
  labs(
    fill = "Black Jail Population",
    title = "Black Jail Population across the US"
  ) +
  theme_minimal()

