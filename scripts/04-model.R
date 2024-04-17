#### Preamble ####
# Purpose: Model is designed to explore and quantify the relationships between a different EPL team's performance (measured in points accumulated) and various economic factors that might influence it.
# Author: Bella MacLean
# Date: 16 April 2024
# Contact: bella.maclean@mail.utoronto.ca
# License: MIT
# Pre-requisites: No
# Any other information needed? No


#### Workspace setup ####
library(tidyverse)
install.packages("rstanarm")
library(rstanarm)

#### Read data ####
analysis_data <- read_csv("data/analysis_data/analysis_data.csv")

### Model data ####
first_model <- stan_glm(
  formula = pts ~ average_home_matchday_attendance + total_wage_bill + market_value,
  data = analysis_data,
  family = gaussian(),  # Assuming the residuals are normally distributed
  prior = normal(location = 0, scale = 2.5, autoscale = TRUE),  # Coefficients
  prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),  # Intercept
  prior_aux = exponential(rate = 1, autoscale = TRUE),  # Error term
  seed = 853  # For reproducibility
)


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


