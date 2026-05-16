-- Q5: Are repeat customers more valuable than one-time customers?
-- Buckets customers by order count using a subquery, then compares spending and behaviour.

SELECT 
    CASE 
        WHEN order_count = 1 THEN 'one-time'
        ELSE 'repeat'
    END AS customer_segment,
    COUNT(*) AS customer_count,
    ROUND(AVG(total_spent), 2) AS avg_total_spent,
    ROUND(AVG(order_count), 2) AS avg_orders_per_customer
FROM (
    SELECT 
        customers.customer_unique_id,
        COUNT(DISTINCT orders.order_id) AS order_count,
        SUM(order_items.price) AS total_spent
    FROM customers
    INNER JOIN orders 
        ON customers.customer_id = orders.customer_id
    INNER JOIN order_items 
        ON orders.order_id = order_items.order_id
    GROUP BY customers.customer_unique_id
) AS customer_totals
GROUP BY customer_segment
ORDER BY customer_count DESC;

-- Findings:
-- - Only ~3% of customers are repeat buyers (2,913 of 95,420) - low marketplace retention.
-- - Repeat customers spend 89% more on average (R$262 vs R$139), driven by repeat purchase frequency (2.11 orders avg) rather than larger basket size.
-- - Even small improvements in retention would compound significantly given the size of the one-time customer base.
-- - Note: uses customer_unique_id (not customer_id) to correctly identify repeat behaviour - Olist's customer_id is per-order.