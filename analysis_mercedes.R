# Install Libraries
library(tidyverse)
library(ggplot2)
library(caret)
library(randomForest)

# Load Data
df <- read.csv("data_merc.csv")

# Explore Data
head(df)
str(df)
summary(df)

# Check for missing values
colSums(is.na(df))

# Visualization
# Average Price by Model
result <- df %>%
  group_by(model) %>%
  summarize(count = n(), avg_price = mean(price, na.rm = TRUE)) %>%
  arrange(desc(avg_price))

# Highest and Lowest average price
result %>%
  head(5)

result %>%
  tail(5)

# Plot Average Price by Model
ggplot(result, aes(x = avg_price, y = reorder(model, avg_price))) +
  geom_bar(stat = "identity", fill = "skyblue", color = "black") +
  geom_text(aes(label = scales::dollar(avg_price), hjust = -0.5), color = "black") +
  labs(title = "Average Price by Model",
       x = "Average Price",
       y = "Model") +
  theme(axis.text.y = element_text(angle = 0, hjust = 1))

# Plot Distribution of Prices
ggplot(df, aes(x = price)) +
  geom_histogram(binwidth = 500, fill = "skyblue") +
  labs(title = "Distribution of Prices",
       x = "Price",
       y = "Count")

# Plot Distribution of Engine Size
ggplot(df, aes(x = engineSize)) +
  geom_histogram(binwidth = 0.2, fill = "skyblue", color = "black") +
  labs(title = "Distribution of Engine Size",
       x = "Engine Size",
       y = "Count")

# Plot Correlation between price and mileage
cor_value <- cor(df$price, df$mileage)

ggplot(df, aes(x = mileage, y = price)) +
  geom_point(color = "skyblue") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  geom_text(x = max(df$mileage), y = min(df$price), 
            label = paste("Correlation =", round(cor_value, 2)),
            hjust = 1, vjust = 0) +
  labs(title = "Correlation between Price and Mileage",
       x = "Mileage",
       y = "Price")

# Data Preparation
# 1. Convert categorical variables to factors
df$transmission <- as.factor(df$transmission)
df$fuelType <- as.factor(df$fuelType)

# 2. Remove 0 Engine Size
df <- df %>%
  filter(engineSize != 0)

# 3. Identify and handle outliers using boxplot.stats
outliers <- boxplot.stats(df$price)$out
df <- df %>%
  filter(!price %in% outliers)

# 4. Update Value after remove outliers
result <- df %>%
  group_by(model) %>%
  summarize(count = n(), avg_price = mean(price, na.rm = TRUE)) %>%
  arrange(desc(avg_price))

ggplot(df, aes(x = price)) +
  geom_histogram(binwidth = 500, fill = "skyblue") +
  labs(title = "Distribution of Prices",
       x = "Price",
       y = "Count")

cor_value <- cor(df$price, df$mileage)

ggplot(df, aes(x = mileage, y = price)) +
  geom_point(color = "skyblue") +
  geom_smooth(method = "lm", se = FALSE, color = "black") +
  geom_text(x = max(df$mileage), y = min(df$price), 
            label = paste("Correlation =", round(cor_value, 2)),
            hjust = 1, vjust = 0) +
  labs(title = "Correlation between Price and Mileage",
       x = "Mileage",
       y = "Price")

# Final Data
view(df)

# Modeling
# 1. Train-Test Split (80:20):
set.seed(123)
split <- createDataPartition(y = df$price, p = 0.8, list = FALSE)
train_set <- df[split, ]
test_set <- df[-split, ]

# 2. Model Training:
# i. Linear Regression as Baseline Model:
# Train the model
lm_model <- lm(price ~ ., data = train_set)

# Make predictions on the test set
lm_predictions <- predict(lm_model, newdata = test_set)

# Error factor model has new levels 200
test_set <- test_set[test_set$model != "200", ]

# Make predictions again
lm_predictions <- predict(lm_model, newdata = test_set)

# ii. Random Forest:
rf_model <- randomForest(price ~ ., data = train_set)

# Make predictions on the test set
rf_predictions <- predict(rf_model, newdata = test_set)

# 3. Scoring:
# Calculate RMSE for both models
lm_rmse <- RMSE(lm_predictions, test_set$price)
rf_rmse <- RMSE(rf_predictions, test_set$price)
lm_mae <- MAE(lm_predictions, test_set$price)
rf_mae <- MAE(rf_predictions, test_set$price)

# Print the evaluation metrics
cat("Linear Regression RMSE:", lm_rmse, "\n")
cat("Linear Regression MAE:", lm_mae, "\n")
cat("Random Forest RMSE:", rf_rmse, "\n")
cat("Random Forest MAE:", rf_mae, "\n")

# RMSE: 2209.229 (Random Forest) < 3524.137 (Linear Regression)
# MAE: 1546.465 (Random Forest) < 2559.09 (Linear Regression)

# 4. Model Evaluation:
# Plot the predictions against actual prices
ggplot() +
  geom_point(aes(x = test_set$price, y = rf_predictions), color = "skyblue") +
  geom_abline(intercept = 0, slope = 1, color = "red", linetype = "dashed") +
  labs(title = "Random Forest: Predictions vs. Actual Prices",
       x = "Actual Price",
       y = "Predicted Price")

# Visualize Feature Importance for Random Forest
varImpPlot(rf_model, main = "Variable Importance")

# Save the Random Forest model
saveRDS(rf_model, "random_forest_model.rds")