# 📊 Telecom Customer Churn Prediction and Analysis

This project demonstrates an **end-to-end churn analysis pipeline**, combining data preparation in SQL, predictive modeling in Python, and interactive visualization in Power BI.

## 🎯  Objective

Analyze telecom customer churn behavior, build a predictive model to forecast churn risk for new joiners, and visualize the results in an interactive dashboard.

## 🛠  Tools and Technologies

* **MySQL:** Data cleaning, preparation, and feature engineering
* **Python (scikit-learn):** Model training and predictions
* **Power BI:** Data visualization and reporting


## ⚙️ Workflow Overview

### 1️⃣ Data Preparation (SQL)

* Created a dedicated database `db_churn`
* Imported raw churn data from CSV
* Cleaned and standardized the data:

  * Trimmed whitespace
  * Handled missing values with `NULLIF()` and `IFNULL()`
  * Labeled empty fields as `None`, `No`, or `Others`
* Created a clean production table for visualization
* Generated two SQL views:

  * **Training View:** Historical churn and stayed customers
  * **Testing View:** New joiners to predict churn risk


### 2️⃣ Machine Learning (Python)

* Exported SQL views to Excel for processing
* Trained a **Random Forest Classifier** using the training data
* Predicted churn status for new joiners
* Saved predictions to a CSV file


### 3️⃣ Data Visualization (Power BI)

* Imported cleaned data and predictions
* Created measures:

  * Total Customers
  * Total Churned Customers
  * Churn Rate
  * New Joiners
* Added calculated columns:

  * Monthly Charge Range
  * Age Groups
  * Tenure Groups
* Designed visuals:

  * Churn Rate by Demographics and Services
  * Top Churn Reasons
  * Slicers for filtering by Internet Type and Monthly Charges
* Built interactive dashboards for exploration


## ✅ Key Results

* Identified churn patterns by contract type, tenure, and demographics
* Predicted churn risk for new customers
* Delivered actionable dashboards to support business decisions



