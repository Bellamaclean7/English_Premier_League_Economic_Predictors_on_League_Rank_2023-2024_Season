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
library(readr)
library(dplyr)
library(arrow)

#### Clean data ####
# Load the matchday attendance dataset from a CSV file that shows every teams average home matchday attendace for the 2023-2024 season
matchday_attendance <- read.csv("data/raw_data/average_home_matchday_attendance_2023-2024.csv")
# Load the market value dataset from a CSV file that shoes the current market value of each team in the English Premier League
market_value <- read.csv("data/raw_data/market_value_2023-2024.csv")
# Load the team rank dataset from a CSV file that shows the current points held by each team in the standings up to matachday 30 of the 2023-2024 season
team_rank <- read.csv("data/raw_data/team_rank_2023-2024.csv")
# Load the total payroll dataset from a CSV file that shoes each teams total payroll for the 2023-2024 season
total_payroll <- read.csv("data/raw_data/total_payroll_2023-2024.csv")
# Load the total transfer spending dataset from a CSV file that shows the total transfer spending of each EPL team entering the 2023-2024 season
total_transfer_spending <- read.csv("data/raw_data/total_transfer_spending_2023-2024.csv")

# Merge the five datasets into one
# The datasets are merged on the team column
analysis_data <- matchday_attendance |>
  full_join(market_value, by = "team") |>
  full_join(team_rank, by = "team") |>
  full_join(total_payroll, by = "team") |>
  full_join(total_transfer_spending, by = "team")

# Inspect the dataset
head(analysis_data)

# Convert character columns with numeric values to numeric types after removing non-numeric characters
analysis_data$average_home_matchday_attendance <- as.integer(gsub(",", "", analysis_data$average_home_matchday_attendance))
analysis_data$total_wage_bill <- as.numeric(gsub("£", "", gsub(",", "", analysis_data$total_wage_bill)))
analysis_data$transfer_fees <- as.numeric(gsub("£", "", gsub(",", "", analysis_data$transfer_fees)))
# Assuming market_value is already in a format that can be directly converted
analysis_data$market_value <- as.numeric(analysis_data$market_value)

# Get rid of total payroll per position columns and the active.players column
analysis_data <- analysis_data |>
  select(-active.palyers, -forwards, -midfielders, -defensmen, -goalkeepers)

# Scale the total_wage_bill by dividing by 1 billion to match the market_value scale
analysis_data$total_wage_bill <- analysis_data$total_wage_bill / 1e9

# Scale the transfer_fees by dividing by 1 billion to match the market_value scale
analysis_data$transfer_fees <- analysis_data$transfer_fees / 1e9

# Inspect the dataset
head(analysis_data)

#### Save data ####
write_csv(analysis_data, "data/analysis_data/analysis_data.csv")
write_parquet(analysis_data, "data/analysis_data/analysis_data.parquet")

