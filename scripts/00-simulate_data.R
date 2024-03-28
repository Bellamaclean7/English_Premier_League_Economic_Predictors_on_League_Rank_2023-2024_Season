#### Preamble ####
# Purpose: Simulates the primary data of interest.
# Author: Bella MacLean
# Date: 28 March 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed?: No


#### Workspace setup ####
library(tidyverse)
library(ggplot2)
library(corrplot)


#### Simulate data ####
set.seed(123) # Setting seed for reproducibility

# Calculate correlation matrix
cor_matrix <- cor(merged_data |> select(where(is.numeric)), use = "complete.obs")

# Generate corrplot 
corrplot(cor_matrix, method = "circle", type = "upper", order = "hclust",
         tl.col = "black", tl.srt = 90)

ggplot(merged_data, aes(x = win_rate_first6, y = win_rate_season)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Comparison of Win Rates",
       x = "Win Rate in First 6 Games",
       y = "Overall Season Win Rate")

ggplot(merged_data, aes(x = factor(season), y = pts_pct_first6)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Percentage of Points Accumulated in First 6 Games by Season",
       x = "Season",
       y = "Percentage of Points") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

ggplot(merged_data, aes(x = goal_scoring_rate_first6, y = goal_conceding_rate_first6)) +
  geom_point(aes(color = factor(season))) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Goal Scoring vs. Conceding Rate in First 6 Games",
       x = "Goal Scoring Rate",
       y = "Goal Conceding Rate") +
  scale_color_discrete(name = "Season")

