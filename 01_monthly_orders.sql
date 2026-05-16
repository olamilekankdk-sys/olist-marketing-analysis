-- Q1: What does monthly order volume look like over time?
-- Source: orders table only. Uses strftime to extract year-month from timestamp.

SELECT strftime('%Y-%m', order_purchase_timestamp), COUNT(*)
FROM orders
GROUP BY strftime('%Y-%m', order_purchase_timestamp)
ORDER BY strftime('%Y-%m', order_purchase_timestamp);

-- Findings:
-- - Platform launched Sept 2016 with 4 orders; first meaningful month Jan 2017 (800).
-- - Steady growth through 2017; peak in Nov 2017 (7,544) coinciding with Black Friday.
-- - Plateaued at 6,000-7,000 orders/month through most of 2018.
-- - Data appears truncated after Aug 2018 (Sept: 16 orders, Oct: 4) - limits recent trend analysis.