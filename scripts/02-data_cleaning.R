#### Preamble ####
# Purpose: Merges the datasets league_results_2007-2023.csv and league_results_first_six_games.csv and cleans the data + creates predictive features for modelling
# Author: Bella MacLean
# Date: 28 March 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed?: No

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
# Load the full season stats dataset for Toronto FC from a CSV file
full_season_stats <- read.csv("data/raw_data/league_results_2007-2023.csv")
# Load the dataset for Toronto FC's results in the first six games of each season from a CSV file
first_six_games_stats <- read.csv("data/raw_data/league_results_first_six_games.csv")

# Merge the two datasets into one
# The datasets are merged on 'season' and 'team_name' columns, ensuring that each season's full season stats
# are combined with the corresponding stats from the first six games
merged_data <- full_season_stats |>
  full_join(first_six_games_stats, by = c("season", "team_name"))

# Replacing all NA (missing) values in numeric columns with 0
# This is done using the `mutate` function combined with `across` and `where(is.numeric)`,
# which applies the operation to all numeric columns
# The `ifelse(is.na(.), 0, .)` inside `mutate` checks each value in these columns;
# if it is NA, it gets replaced by 0, otherwise the original value is kept
merged_data <- merged_data |>
  mutate(across(where(is.numeric), ~ifelse(is.na(.), 0, .)))

# Check if the 'team_name' column has any NA values and replace them with "Toronto FC"
merged_data$team_name <- ifelse(is.na(merged_data$team_name), "Toronto FC", merged_data$team_name)

# Inspect the merged dataset
head(merged_data)

# Rename the columns in the merged_data dataframe
merged_data <- merged_data |>
  rename(
    w = w.x,
    d = d.x,
    l = l.x,
    gf = gf.x,
    ga = ga.x,
    gd = gd.x,
    pts = pts.x,
    w_first6 = w.y,
    d_first6 = d.y,
    l_first6 = l.y,
    gf_first6 = gf.y,
    ga_first6 = ga.y,
    gd_first6 = gd.y,
    pts_first6 = pts.y
  )

merged_data <- merged_data |>
  mutate(
    # Calculate the win rate for the first 6 games of the season.
    win_rate_first6 = w_first6 / 6,
    # Calculate the win rate for the entire season.
    win_rate_season = w / mp,
    # Calculate the percentage of points accumulated in the first 6 games of the season.
    pts_pct_first6 = (pts_first6 / pts) * 100,
    # Calculate average goals scored per game over the season.
    avg_goals_scored_per_game = gf / mp,
    # Calculate the points rate in the first 6 games (points obtained divided by maximum possible points, 18).
    pts_rate_first6 = pts_first6 / 18,
    # Calculate the goal scoring rate in the first 6 games (goals for divided by 6).
    goal_scoring_rate_first6 = gf_first6 / 6,
    # Calculate the goal conceding rate in the first 6 games (goals against divided by 6).
    goal_conceding_rate_first6 = ga_first6 / 6
  )
# These new features are intended to provide additional insights for predicting league rank,
# based on early-season performance and overall season efficiency.

merged_data <- merged_data |>
  mutate(
    win_rate_season = ifelse(is.na(win_rate_season) | is.infinite(win_rate_season), 0, win_rate_season),
    pts_pct_first6 = ifelse(is.na(pts_pct_first6) | is.infinite(pts_pct_first6), 0, pts_pct_first6),
    avg_goals_scored_per_game = ifelse(is.na(avg_goals_scored_per_game) | is.infinite(avg_goals_scored_per_game), 0, avg_goals_scored_per_game)
  )

#### Save data ####
write_csv(merged_data, "data/analysis_data/analysis_data.csv")
