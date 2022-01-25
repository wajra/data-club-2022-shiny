# Working with Palmer Penguins
# 2022-01-22

library(palmerpenguins)
library(tidyverse)

# A look at the dataset
print(summary(penguins))

# Distribution density of Bill Length among the three species
ggplot(penguins, aes(x=bill_length_mm, color=species, fill=species)) +
  geom_density(alpha=0.5) + labs(x="Bill Length (mm)", y="Density")

# How bill length and bill depth are distributed among the three species
ggplot(penguins, aes(x=bill_length_mm, y=bill_depth_mm)) +
  geom_point() + labs(x="Bill Length (mm)", y="Density") +
  facet_wrap(~species)

# We'll explore this dataset in a similar fashion using Shiny!!