-- Segments products based on cost 
WITH product_segments AS (
	SELECT
		CASE 
			WHEN cost > 1000 THEN 'Above 1000'
			WHEN cost BETWEEN 500 AND 1000 THEN '500-1000'
			WHEN cost BETWEEN 100 AND 500 THEN '100-500'
			ELSE 'Below 100'
		END AS cost_range,
		product_key
		FROM gold.dim_products		
)

SELECT
	cost_range,
	COUNT(product_key) AS products_count
FROM product_segments
GROUP BY cost_range
ORDER BY products_count DESC;


-- Segments customers based on three ranges of spending behaviour
WITH spending_ranges AS (
	SELECT
		CASE
			WHEN DATEDIFF(month, MIN(order_date), MAX(order_date)) >= 12 AND SUM(sales_amount) > 5000 THEN 'VIP'
			WHEN DATEDIFF(month, MIN(order_date), MAX(order_date)) >= 12 AND SUM(sales_amount) <= 5000 THEN 'REGULAR' 
			ELSE 'New'
		END AS spending_range,
		customer_key
	FROM gold.fact_sales
	GROUP BY customer_key
)

SELECT 
	spending_range,
	COUNT(customer_key) as customers_count
FROM spending_ranges
GROUP BY spending_range
ORDER BY customers_count DESC;
