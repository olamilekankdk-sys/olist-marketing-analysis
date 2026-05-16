-- Q6: Which customer states have the highest average delivery time, and does delivery time correlate with review scores?
-- Joins orders -> customers -> order_reviews; filters to delivered orders with valid delivery dates.

SELECT 
    customers.customer_state,
    COUNT(*) AS delivered_orders,
    ROUND(AVG(julianday(orders.order_delivered_customer_date) - julianday(orders.order_purchase_timestamp)), 1) AS avg_delivery_days,
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

-- Findings:
-- - São Paulo (SP) delivers in 8.8 days on average, vs Amazonas (AM) at 26.3 - a 3x gap.
-- - Review scores correlate weakly with delivery time: fastest states score 4.13-4.25, slowest 3.84-4.22.
-- - Outlier: Amazonas has the slowest delivery but a 4.22 review score (likely expectation-adjusted - remote region customers expect delays).
-- - Highest leverage for improvement: northeast states (AL, MA, CE) where delivery is slow AND review scores below 4.0.
-- - Excluded undelivered orders and NULL delivery dates; restricted to states with at least 100 delivered orders.