
# A chart that visualizes the distribution of prison population across 
# different states? As this will help use identify which states has 
# the highest and the lowest incarceration rates so that we an compare and 
# contrast what one state lacks or what the other has that result in lower
# incarceration levels

library(ggplot2)

#Load the dataset

prison_per_county_state <- read.csv("https://raw.githubusercontent.com/melaniewalsh/Neat-Datasets/main/us-prison-pop.csv")

# Filtered data for black male prison population in California

black_CA <- subset(prison_per_county_state,  state %in% c("CA", "TX"))

# View filtered data
head(black_CA)

# Chart 1: Analyzing incarceration levels of black male prisioner in califronia and texas 

ggplot(data = black_CA, aes(
  x = state, 
  y = black_male_prison_pop,
  fill = state)) +
  geom_bar(stat = "identity") + 
  labs(y = "Black Male Prison Population", 
       x = "State",
       fill = "State") +
  ggtitle("Distribution of Incarceration Levels of Black Males Between California and Texas")



# Objective: A chart that will visualize the trend of prison population over time 
# for a specific state or for all states combined . 

ggplot(data = black_CA, aes(
  x = black_male_prison_pop, 
  y = black_male_prison_pop,
  color = state)) +
  geom_point(na.rm = FALSE) + 
  labs(y = "Black Male Prison Population in Texas", 
       x = "Black Male Prison Population in California",
       color = "States Colors") +
  ggtitle("Distribution of Incarcirations levels of Black Males Between Califronia and Texas!")


