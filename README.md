# Olist Ecommerce SQL Analysis

A recruiter-ready SQL case study using the public Olist Brazilian ecommerce dataset. The project analyses approximately 100,000 orders across nine related tables and turns operational data into clear marketing and customer insights.

## Business questions

1. How do revenue and order volume change over time?
2. Which order statuses account for incomplete demand?
3. Where are customers concentrated geographically?
4. Which payment methods and instalment patterns are most common?
5. How does delivery performance vary?
6. How do delivery times and review scores vary by state?

## What the repository demonstrates

- Joining and validating multiple relational tables
- Aggregation, filtering, date logic and common table expressions
- Customer, revenue, payment and delivery analysis
- Clear comments, reproducible queries and business-oriented interpretation

## Repository guide

- 01_revenue_trends.sql — revenue and order trends
- 02_order_status.sql — order-status analysis
- 03_customer_geography.sql — customer distribution
- 04_payment_behaviour.sql — payment methods and instalments
- 05_delivery_performance.sql — delivery timing
- 06_delivery_and_reviews.sql — descriptive comparison of delivery and reviews by state
- data/ — source files or loading guidance

## Important limitation

The sixth query compares state-level delivery and review metrics descriptively. It does not calculate a statistical correlation coefficient, so the results should not be presented as proof that one metric causes or predicts the other.

## Tools

SQL and GitHub. This is a standalone SQL case study; the separate GA4 Looker Studio project uses a different sample dataset.

## Author

Olamilekan Kadiku — Marketing Data Analyst  
[Portfolio](https://github.com/olamilekankdk-sys/portfolio) · [LinkedIn](https://www.linkedin.com/in/lekankdk/)
