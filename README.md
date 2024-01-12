# Mercedes Benz Price Prediction

## Overview

In this project, I aimed to develop a predictive model for estimating the prices of used Mercedes-Benz cars. My objective was to create an advanced pricing tool that could empower junior salespeople, enhancing their decision-making capabilities.

## Data Exploration

I began the project by exploring the dataset, which included information on various features such as model, price, mileage, engine size, transmission, and fuel type. This initial step involved checking for missing values, visualizing the distribution of prices, and examining relationships between different variables. Insights obtained from these exploratory analyses laid the foundation for subsequent model development.

## Visualization and Analysis

I utilized visualizations to gain insights into the data. One notable analysis involved plotting the average price by model, highlighting the highest and lowest average prices. Additionally, I examined the distribution of prices, engine sizes, and explored the correlation between price and mileage.

## Data Preparation

To prepare the data for modeling, I converted categorical variables (transmission, fuel type) to factors, removed instances with zero engine size, and identified and handled outliers using the boxplot.stats method.

## Modeling

The modeling phase involved splitting the dataset into training and testing sets. I trained two models: Linear Regression and Random Forest. Evaluation metrics such as Root Mean Squared Error (RMSE) and Mean Absolute Error (MAE) were employed to assess model performance. Random Forest outperformed Linear Regression in terms of RMSE and MAE.

## Model Evaluation

The project included a thorough evaluation of the Random Forest model. Visualizations showcased predictions against actual prices, and a feature importance plot provided insights into the significant variables driving the model. The final Random Forest model demonstrated promising results with average percentage errors for most models below 5% and absolute errors averaging less than $700.

## Recommendations

Based on the project outcomes, recommendations for future improvements were made. These included collecting more data, exploring different algorithms, and conducting hyperparameter tuning to further enhance model accuracy.
