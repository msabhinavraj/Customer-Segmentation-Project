# Customer Segmentation Using K-Means Clustering

Analyze banking customer data to identify and visualize client segments, enabling targeted financial strategies.

---

##  Project Overview

This repository contains a complete workflow for segmenting bank customers using K-Means clustering in Python. By leveraging features such as age, normalized account balance, and transaction amounts, this analysis provides actionable insights for personalized banking services.

---

##  Contents

- **Customer_Segmentation.ipynb**  
  Main Jupyter notebook: covers data cleaning, normalization, clustering, and visualization.
- **Normalized_bank_transactions.csv**  
  Cleaned and normalized data for segmentation.
- **segment_plot.jpg**  
  Visualization of clusters labeled by business segment.

---

##  Approach

1. **Data Preparation**  
   - Parsed and cleaned dates of birth and calculated customer ages.
   - Removed negative ages and normalized all numerical fields.

2. **Clustering**  
   - Selected essential features: age, account balance, and transaction amount.
   - Applied K-Means to identify distinct customer groups.

3. **Visualization**  
   - Labeled clusters with business-friendly categories:
     - Young mass-market/entry-level
     - Affluent mid-life customers
     - Middle-class stable customers
     - High-value VIP seniors

4. **Business Insights**  
   - Enables banks to tailor products, marketing, and retention strategies to each segment.

---

##  Usage

- Open the notebook in Jupyter or Colab.
- Run the workflow step-by-step to reproduce the segmentation and plots.
- Adapt the workflow for your own banking or customer datasets.
