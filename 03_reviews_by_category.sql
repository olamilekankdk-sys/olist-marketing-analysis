-- Q3: What's the average review score by product category?
-- Joins order_reviews -> orders -> order_items -> products -> translation.
-- Filtered to categories with at least 100 reviews.

SELECT product_category_name_translation.product_category_name_english,
       ROUND(AVG(order_reviews.review_score), 2) AS avg_review_score,
       COUNT(*) AS review_count
FROM order_reviews
INNER JOIN orders 
    ON order_reviews.order_id = orders.order_id
INNER JOIN order_items 
    ON orders.order_id = order_items.order_id
INNER JOIN products 
    ON order_items.product_id = products.product_id
INNER JOIN product_category_name_translation 
    ON products.product_category_name = product_category_name_translation.product_category_name
GROUP BY product_category_name_translation.product_category_name_english
HAVING COUNT(*) >= 100
ORDER BY avg_review_score DESC
LIMIT 10;

-- Findings:
-- - Books dominate top-rated categories (general_interest 4.45, technical 4.37) but on modest review volumes.
-- - Luggage_accessories ranks 3rd at 4.32 with 1,088 reviews - highest combination of score and scale.
-- - Top 10 scores cluster tightly between 4.17 and 4.45; the meaningful signal is volume, not score.
-- - Categories below 100 reviews excluded via HAVING to avoid small-sample noise.