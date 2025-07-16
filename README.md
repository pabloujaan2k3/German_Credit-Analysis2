📌 Overview
This project analyzes the German Credit Dataset to predict loan default risk using logistic regression and Random Forest models in R. The goal is to compare model performance and identify key factors influencing creditworthiness decisions.

🔍 Key Features
Predictive Modeling: Built and evaluated logistic regression vs. Random Forest to classify "Good" or "Bad" credit risk.

Data Insights: Explored feature importance (e.g., loan amount, duration) to understand risk drivers.

Performance Metrics: Compared models using ROC-AUC analysis, with Random Forest achieving higher predictive accuracy.

🛠️ Technical Implementation
Data Preprocessing: Handled categorical variables, missing values, and feature scaling.

Model Training: Used caret for cross-validation and hyperparameter tuning.

Visualization: Generated ROC curves, density plots, and variable importance charts with ggplot2 and pROC.

📂 Files Included
German_data credit.R: R script with full code for data cleaning, modeling, and visualization.

model_performance.csv: AUC scores for both models.

rf_model.rds: Saved Random Forest model for deployment.

💡 How to Use
Run the R script to reproduce the analysis.

Modify the models or datasets (e.g., try XGBoost) for further experimentation.
