-- Q6: How do average delivery time and review score vary by customer state?
-- This is a descriptive state-level comparison. It does not calculate a
-- Pearson or Spearman correlation coefficient and should not be read as causation.
-- Joins orders -> customers -> order_reviews and includes delivered orders
-- with valid delivery dates.

SELECT
    customers.customer_state,
    COUNT(*) AS delivered_orders,
    ROUND(
        AVG(
            julianday(orders.order_delivered_customer_date)
            - julianday(orders.order_purchase_timestamp)
        ),
        1
    ) AS avg_delivery_days,
    ROUND(AVG(order_reviews.review_score), 2) AS avg_review_score
FROM orders
INNER JOIN customers
    ON orders.customer_id = customers.customer_id
INNER JOIN order_reviews
    ON orders.order_id = order_reviews.order_id
WHERE orders.order_status = 'delivered'
  AND orders.order_delivered_customer_date IS NOT NULL
GROUP BY customers.customer_state
HAVING COUNT(*) >= 100
ORDER BY avg_delivery_days DESC;

-- Descriptive findings:
-- - Average delivery time varies materially by state: São Paulo (SP) is
--   approximately 8.8 days, compared with approximately 26.3 days in Amazonas (AM).
-- - Review-score averages do not move consistently with delivery-time averages
--   across every state; a formal coefficient would be required to quantify association.
-- - States combining longer delivery times and review scores below 4.0 warrant
--   further investigation before any operational recommendation is made.
-- - Undelivered orders and NULL delivery dates are excluded.
-- - Results are limited to states with at least 100 delivered orders.
