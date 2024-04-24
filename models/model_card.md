# Model card for model.rds

Jump to section:

- [Model details](#model-details)
- [Intended use](#intended-use)
- [Data](#data)
- [Model Justification](model-justification)
- [Model Training and Validation](#model-training-and-validation)
- [Results](#results)
- [Ethical considerations](#ethical-considerations)
- [Usage and Maintenance](#usage-and-maintenance)
- [Conclusion](#conclusion)

## Model details

Model Type: Linear Regression
Function: lm in R
Model Version: 1.0

## Intended use

Purpose: To predict the performance of English Premier League (EPL) teams based on various economic factors.

Intended Use: This model is intended for sports analysts, team strategists, and sports economists to assess how different economic factors influence team success in the league standings.

## Data

Variables Used

Dependent Variable: Points (pts)

Independent Variables: Average home matchday attendance, total wage bill, market value.

## Model Justification

Hypothesis: There is a positive correlation between the team's performance (points) and the three independent variables: home matchday attendance, total payroll, and market value. Higher values in these variables are expected to result in a higher number of points, reflecting better performance in the league.

## Model Training and Validation

Algorithm: Linear regression using the lm function in R.

Evaluation: The model's performance was evaluated based on the significance of coefficients, the magnitude of R-squared, and residual analysis.

## Results

Coefficients: The model found significant positive relationships for some predictors with team points, particularly market value.

Performance Metrics
R-squared: 0.8057
Adjusted R-squared: 0.7693
F-statistic: 22.12 on 3 and 16 DF
p-value: 6.159e-06

## Ethical Considerations

Fairness and Bias: Attention was given to the equitable representation of teams in the data. Further analysis is required to address potential biases and ensure fairness across variables.

Mitigation Strategies: Ongoing analysis will be required to monitor and adjust for any biases or anomalies detected in the model predictions.

## Usage and Maintenance

Recommendations for Maintenance: It is recommended to update the model annually with new season data to maintain its accuracy and relevance.

Contact: For more details or queries regarding the model, please contact bella.maclean@mail.utoronto.ca

## Conclusion

This model provides insights into the factors influencing EPL team performance, with significant predictive capability as demonstrated by the strong R-squared value. The identified relationships between team performance and economic factors can assist in strategic decision-making for team management and investment.
