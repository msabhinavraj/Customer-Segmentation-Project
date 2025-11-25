# Customer-Segmentation-Project
Customer Segmentation Using K-Means Clustering
This project analyzes banking customer data to segment clients into distinct groups using K-Means clustering in Python. The primary goal is to uncover meaningful customer segments based on age, account balance, and transaction behavior, empowering banks to tailor services and marketing strategies.

Contents
Customer_Segmentation.ipynb: Main Jupyter notebook with data cleaning, normalization, feature selection, clustering, and visualization code.

Normalized_bank_transactions.csv: Cleaned and normalized dataset prepared for clustering.

segment_plot.jpg: Output image showing the clusters and their business interpretation.

Approach
Data Preparation: Raw banking data was cleaned and transformed. Dates of birth were parsed, ages calculated, and negative ages excluded. Numeric features were normalized for optimal clustering.

Clustering: Key features (age, normalized account balance, transaction amount) were selected for K-Means clustering. The optimal number of clusters was chosen to distinguish meaningful customer groups.

Visualization: Results were visualized, with clusters labeled as business segments (e.g., Young mass-market, Affluent mid-life, Middle-class stable, and High-value VIP seniors).

Business Insight: Segmenting customers allows banks to personalize offerings and improve targeting for products, marketing, and risk management.
