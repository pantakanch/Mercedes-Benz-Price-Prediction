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

## Recommendation

- **Collect More Data:** Expanding the dataset can further enhance model accuracy.
- **Explore Different Algorithms:** Trying different machine learning algorithms could uncover alternative models with improved performance.
- **Hyperparameter Tuning:** Fine-tuning model parameters to optimize predictive capabilities.
- **Exercise Caution with Rare Models:** Advise salespeople to be cautious when relying on predictions for car models with fewer than 50 instances, including GLB Class, G Class, CLK, CLC Class, R Class, 180, 200, 220, and 230. The model may have limited data to make accurate predictions for these rare models. Salespeople may manually adjust the predicted prices based on their understanding of market demand or consult with senior salespeople.
