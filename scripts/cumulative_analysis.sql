-- Shows the total revenue along the running total revenue and the average price per month along the moving average price  
SELECT
	order_date,
	total_revenue,
	SUM(total_revenue) OVER (ORDER BY order_date) AS running_total_revenue,
	avg_price,
	AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    SELECT 
        DATETRUNC(month, order_date) AS order_date,
        SUM(sales_amount) AS total_revenue,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(month, order_date)
) t
