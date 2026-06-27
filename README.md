# Olist E-commerce SQL Analysis

A SQL analysis of the Olist Brazilian E-commerce public dataset (~100k orders, 9 tables), exploring sales performance, customer behaviour, and operational quality through six business questions.

**Tools:** SQLite, DBeaver, Looker Studio
**Skills demonstrated:** Multi-table joins, aggregation, subqueries, CASE statements, HAVING filters, date arithmetic, business interpretation of results.

## 📊 Interactive Dashboard

The findings below are visualised in a live **Looker Studio** report:

- **View embedded (GitHub Pages):** https://olamilekankdk-sys.github.io/olist-marketing-analysis/dashboard/
- **Open directly in Looker Studio:** [View report](https://lookerstudio.google.com/reporting/99a23161-08fe-49eb-8981-d09050026641)

## Dataset

[Olist Brazilian E-commerce dataset on Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) — 9 tables covering orders, customers, products, payments, reviews, and geography for a Brazilian online marketplace, 2016–2018.

## Business Questions

Each `.sql` file  contains the question, the query, and the findings.

| # | Question | Key finding |
|---|---|---|
| 1 | What does monthly order volume look like over time? | Platform grew from 4 orders (Sept 2016) to a peak of 7,544 (Nov 2017, Black Friday); plateaued at ~6-7k/month through 2018. |
| 2 | Which product categories generate the most revenue? | Health & beauty leads at R$1.26M; top 3 categories generate over R$3.5M combined. |
| 3 | What's the average review score by product category? | Books rate highest (4.45) but on modest volume; luggage combines high score (4.32) with scale (1,088 reviews). |
| 4 | Which payment methods are most popular? | Credit card dominates (~73% of volume); boleto has highest average value, suggesting bigger-basket use. |
| 5 | Are repeat customers more valuable than one-time? | Only 3% of customers return — but they spend 89% more on average. Major retention opportunity. |
| 6 | Does delivery time correlate with review scores by state? | São Paulo delivers 3x faster than Amazonas (8.8 vs 26.3 days); review correlation is real but weaker than expected. |

## Method Notes

- Restricted Q3 to categories with at least 100 reviews via `HAVING`, to avoid small-sample noise.
- Q5 uses `customer_unique_id` rather than `customer_id` — Olist's `customer_id` is per-order and would miss repeat behaviour.
- Q6 filters to `order_status = 'delivered'` and excludes NULL delivery dates so date arithmetic returns valid values.
- Data appears truncated after August 2018, limiting recent trend analysis (see Q1 findings).

## Author

Olamilekan Kadiku — Marketing & Data Analyst.
LinkedIn: [linkedin.com/in/lekankadiku](https://www.linkedin.com/in/lekankadiku)
GitHub: [github.com/olamilekankdk-sys](https://github.com/olamilekankdk-sys)
