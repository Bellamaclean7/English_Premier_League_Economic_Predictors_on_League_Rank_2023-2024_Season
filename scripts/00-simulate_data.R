#### Preamble ####
# Purpose: Simulates the primary data of interest.
# Author: Bella MacLean
# Date: 28 March 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed?: No


#### Workspace setup ####

# Install and load necessary packages
install.packages("lintr")
install.packages("dplyr")
install.packages("ggplot2")
library(lintr)
library(dplyr)
library(ggplot2)

# Lint the script for style consistency
lintr::lint("scripts/00-simulate_data.R")

#### Build simulated data ####

# Setting seed for reproducibility
set.seed(500)

#### Simulate data ####

# Simulate data for sports teams
simulated_team_data <-
  tibble(
    sim_team_id = sample(x = 1:20, size = 20, replace = FALSE),
    sim_pts = round(rnorm(20, mean=50, sd=15)),
    sim_average_home_matchday_attendance = round(rnorm(20, mean=30000, sd=5000)),
    sim_total_wage_bill = round(rnorm(20, mean=80000000, sd=20000000)),
    sim_market_value = round(rnorm(20, mean=500000000, sd=150000000)),
    sim_transfer_fees = round(rnorm(20, mean=100000000, sd=30000000))
  )

# Arrange data by team ID
simulated_team_data <- 
  simulated_team_data |>
  arrange(sim_team_id)

#### Graph simulated data ####

# Points vs. Average Matchday Attendance
simulated_team_data |>
  ggplot(aes(x = sim_pts, y = sim_average_home_matchday_attendance)) +
  geom_point() +
  geom_smooth(method = "lm", color = "blue") +
  theme_minimal() +
  labs(title = "Points vs. Average Matchday Attendance",
       x = "Total League Points", y = "Average Home Matchday Attendance")

# Points vs. Total Wage Bill
simulated_team_data |>
  ggplot(aes(x = sim_pts, y = sim_total_wage_bill)) +
  geom_point() +
  geom_smooth(method = "lm", color = "red") +
  theme_minimal() +
  labs(title = "Points vs. Total Wage Bill",
       x = "Total League Points", y = "Total Wage Bill")

# Points vs. Market Value
simulated_team_data |>
  ggplot(aes(x = sim_pts, y = sim_market_value)) +
  geom_point() +
  geom_smooth(method = "lm", color = "green") +
  theme_minimal() +
  labs(title = "Points vs. Market Value",
       x = "Total League Points", y = "Market Value")

# Points vs. Transfer Fees
simulated_team_data |>
  ggplot(aes(x = sim_pts, y = sim_transfer_fees)) +
  geom_point() +
  geom_smooth(method = "lm", color = "purple") +
  theme_minimal() +
  labs(title = "Points vs. Transfer Fees",
       x = "Total League Points", y = "Transfer Fees")

#### Test simulated data ####

# Data validation checks
checks <- list(
  nrow(simulated_team_data) == 20,
  all(simulated_team_data$sim_team_id >= 1 & simulated_team_data$sim_team_id <= 20),
  range(simulated_team_data$sim_pts),
  range(simulated_team_data$sim_average_home_matchday_attendance),
  range(simulated_team_data$sim_total_wage_bill),
  range(simulated_team_data$sim_market_value),
  range(simulated_team_data$sim_transfer_fees)
)

if (any(!unlist(checks))) {
  print("There are errors in the simulated data")
}