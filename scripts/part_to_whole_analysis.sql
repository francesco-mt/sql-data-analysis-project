-- Shows the contribution of each category to the total revenue
WITH category_totals AS (
    SELECT 
        p.category,
        SUM(s.sales_amount) AS total_revenue_by_category
    FROM gold.fact_sales s
    LEFT JOIN gold.dim_products p ON s.product_key = p.product_key
    GROUP BY p.category
)
SELECT 
	SUM(total_revenue_by_category) OVER() as total_revenue,
    category,
	total_revenue_by_category,
	CONCAT(ROUND(CAST(total_revenue_by_category AS FLOAT)/ SUM(total_revenue_by_category) OVER() * 100,2), ' %') as part_to_whole_percentage
FROM category_totals
ORDER BY part_to_whole_percentage DESC;
