library(tidyverse)
library(maps)
library(mapproj)
library(ggplot2)
library(sf) 
library(RColorBrewer)
# the state that we are gonna look at is california as it has the highest incarsiation rates!

# Get map data
map_data <- map_data("state")
