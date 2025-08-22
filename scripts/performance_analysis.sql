/* Analyses the yearly performance of products by comparing their sales 
to both the average sales performance of the product and the previous year's sales */

WITH yearly_product_revenue AS (
    SELECT
        YEAR(s.order_date) AS order_year,
        p.product_name,
        SUM(s.sales_amount) AS current_revenue
    FROM gold.fact_sales s
    LEFT JOIN gold.dim_products p
        ON s.product_key = p.product_key
    WHERE s.order_date IS NOT NULL
    GROUP BY 
        YEAR(s.order_date),
        p.product_name
)
SELECT
    order_year,
    product_name,
    current_revenue,
    AVG(current_revenue) OVER (PARTITION BY product_name) AS avg_revenue,
    current_revenue - AVG(current_revenue) OVER (PARTITION BY product_name) AS diff_avg,
    CASE 
        WHEN current_revenue - AVG(current_revenue) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_revenue - AVG(current_revenue) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    -- Year-over-Year Analysis
    LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_year) AS py_revenue,
    current_revenue - LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
    CASE 
        WHEN current_revenue - LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increased'
        WHEN current_revenue - LAG(current_revenue) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decreased'
        ELSE 'No Change'
    END AS py_change
FROM yearly_product_revenue
ORDER BY product_name, order_year;
