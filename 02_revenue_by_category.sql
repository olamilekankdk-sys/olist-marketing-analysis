-- Q2: Which product categories generate the most revenue?
-- Joins order_items -> products -> translation table for English category names.

SELECT product_category_name_translation.product_category_name_english,
       ROUND(SUM(order_items.price), 2) AS total_revenue
FROM order_items
INNER JOIN products 
    ON order_items.product_id = products.product_id
INNER JOIN product_category_name_translation 
    ON products.product_category_name = product_category_name_translation.product_category_name
GROUP BY product_category_name_translation.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;

-- Findings:
-- - Top category: health_beauty at R$1.26M, followed by watches_gifts (R$1.21M).
-- - Top 3 categories generate over R$3.5M combined.
-- - Revenue spread is fairly even across top 10 - diversified marketplace.