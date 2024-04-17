#### Preamble ####
# Purpose: Test cleaned analysis data
# Author: Bella MacLean
# Date: 28 March 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed?: No


#### Workspace setup ####
library(tidyverse)

# Load the data
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

#### Test data ####
# Check the number of rows in the dataset
actual_number_of_rows <- nrow(analysis_data)
expected_number_of_rows <- 20

# Check for missing values in any column
missing_data_check <- sum(is.na(analysis_data))

# Check data types
glimpse(analysis_data)

# Ensure all numeric columns are non-negative and within expected ranges
range_check <- all(analysis_data$average_home_matchday_attendance >= 0,
                   analysis_data$market_value >= 0,
                   analysis_data$pts >= 0,
                   analysis_data$total_wage_bill >= 0,
                   analysis_data$transfer_fees >= 0)

# Ensure all team names are unique
unique_teams_check <- n_distinct(analysis_data$team) == nrow(analysis_data)

# Output results of tests
list(
  number_of_rows_check = actual_number_of_rows == expected_number_of_rows,
  missing_data_check = missing_data_check == 0,
  range_check = range_check,
  unique_teams_check = unique_teams_check
)
