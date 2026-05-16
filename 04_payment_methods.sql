-- Q4: Which payment methods are most popular, and what's the average order value for each?
-- Single-table analysis using order_payments.

SELECT payment_type,
       COUNT(*) AS payment_count,
       ROUND(AVG(payment_value), 2) AS avg_payment_value
FROM order_payments
GROUP BY payment_type
ORDER BY payment_count DESC;

-- Findings:
-- - Credit card dominates volume: 76,795 transactions (~73% of all payments).
-- - Boleto (Brazilian bank slip) is second at 19,784 with highest avg value (R$145).
-- - Voucher payments (5,775) have the lowest avg value (R$66), suggesting partial / promotional use.
-- - 3 rows with payment_type 'not_defined' and value 0 - minor data quality issue worth flagging.