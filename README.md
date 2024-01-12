# Mercedes-Benz Price Prediction

## Overview

The Mercedes-Benz Price Prediction project is a data-driven initiative designed to empower junior salespeople with an advanced pricing tool, enhancing their decision-making capabilities. The primary objective is to develop a predictive model that accurately estimates the prices of used Mercedes-Benz cars. This project utilizes R programming language, along with popular libraries such as tidyverse, caret, and randomForest.

## Business Objectives

- **Empower Sales Team:** Provide a powerful pricing tool to junior salespeople, enabling them to make informed decisions on used car pricing.
- **Enhance Decision-Making:** Improve decision-making capabilities by leveraging advanced predictive modeling techniques.
  
## Key Features

- **Data Exploration:** Comprehensive exploration of the dataset, including head, structure, and summary analysis, to gain insights into the available information.

- **Visualization:** Utilization of ggplot2 and other visualization tools to create informative plots, such as Average Price by Model, Distribution of Prices, Distribution of Engine Size, and Correlation between Price and Mileage.

- **Data Preparation:** Categorical variables are converted to factors, and outliers are identified and handled. The dataset is refined for modeling.

- **Modeling:** The project employs Linear Regression as a baseline model and Random Forest for predictive modeling. The models are trained and evaluated using metrics like RMSE (Root Mean Squared Error) and MAE (Mean Absolute Error).

- **Model Evaluation:** Visualizations, including a plot of predictions against actual prices and feature importance analysis, contribute to a comprehensive model evaluation.

- **Recommendations:** Insights into model performance and recommendations for future improvements, such as collecting more data, trying different algorithms, and hyperparameter tuning.

## Results

The models demonstrate promising results, with Average % error for most models under 5%, and absolute error on average less than $700. The Random Forest model outperforms the Linear Regression model in terms of both RMSE and MAE.

## Future Steps

- **Collect More Data:** Expanding the dataset can further enhance model accuracy.
- **Explore Different Algorithms:** Trying different machine learning algorithms could uncover alternative models with improved performance.
- **Hyperparameter Tuning:** Fine-tuning model parameters to optimize predictive capabilities.

## Usage

1. **Clone Repository:** Clone this repository to your local machine.
   
2. **Run R Scripts:** Execute R scripts to explore the dataset, visualize insights, prepare data, and train predictive models.

3. **Model Evaluation:** Review model evaluation visualizations to assess the performance of Linear Regression and Random Forest models.

4. **Recommendations:** Consider recommendations for future improvements and optimizations.

Feel free to contribute, provide feedback, or use this project as a foundation for your own pricing prediction endeavors!

---

Feel free to adjust the content based on your project's specific details and preferences.
