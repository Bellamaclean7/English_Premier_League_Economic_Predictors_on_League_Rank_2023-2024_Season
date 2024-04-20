# Total Team Spending and Profitability Results in a Higher League Ranking in the English Premier League

## Overview

This paper reatures an analysis of English Premier League teams rank and team wealth. The final `PDF` report ([link here](https://github.com/Bellamaclean7/English_Premier_League_Economic_Predictors_on_League_Rank_2023-2024_Season/blob/main/paper/paper.pdf)) analyzes the relationship between three explanatory variables: match attendance, total payroll, and market value, and teams total points accumulated during the English Premier League 2023-2024 season. Findings suggest that each explanatory variable significantly influences a team's league position (total points), highlighting the association between team success and team wealth.

## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw datasets
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `model` contains fitted models. 
-   `other` contains relevant literature, details about LLM chat interactions, and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download, test, and clean data.

## Data

The analysis dataset used for this paper is comprised of five datasets that were compiled during the data cleaning process. The first datasea, contains every teams average home matchday attendance for the 2023-2024 season, which was collected from [Football Web Pages](https://www.footballwebpages.co.uk/premier-league/attendances/2022-2023). The second dataset contains every teams current market value, which was collected from [transfermarkt.us](https://www.transfermarkt.us/premier-league/daten/wettbewerb/GB1). The third dataset contains the current total payroll for each team in the English Premier League, and was collected from [spotrac](https://www.spotrac.com/epl/payroll/). The forth dataset contains the total amount spent in transfer fees prior to the start of the 2023-2024 season for each team in the English Premier League, and was collected from [spotrac](https://www.spotrac.com/epl/payroll/). The fifth dataset contains the total points earned by each team in the English Premier League during the 2023-2024 as of Matchday 33, and was retrieved from [transfermarkt.us](https://www.transfermarkt.us/premier-league/daten/wettbewerb/GB1).

## Statement on LLM usage

Code produced to conduct posterior predictive checks and diagnostics on the model used in this paper was written with the help of the ChatGPT. ChatGPT was used to check spelling errors, grammar errors, sentence structure etc. ChatGPT aided in creating my refernce list. The entire chat history is available in [other/llms/usage.txt](https://github.com/Bellamaclean7/English_Premier_League_Economic_Predictors_on_League_Rank_2023-2024_Season/blob/main/other/llm/usage.txt).
