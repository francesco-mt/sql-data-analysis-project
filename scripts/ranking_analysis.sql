-- Shows the 5 products generating the highest revenue
SELECT TOP 5
	p.product_name,
	SUM(s.sales_amount) as total_revenue
FROM gold.fact_sales s 
LEFT JOIN gold.dim_products p  ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- Shows the 5 products generating the lowest revenue
SELECT TOP 5
	p.product_name,
	SUM(s.sales_amount) as total_revenue
FROM gold.fact_sales s 
LEFT JOIN gold.dim_products p  ON s.product_key = p.product_key
GROUP BY p.product_name
ORDER BY total_revenue ASC;


-- Shows the top 10 customers based on revenue generated
SELECT TOP 10
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(s.sales_amount) AS total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c ON c.customer_key = s.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;


-- Shows The 3 customers with the fewest orders placed
SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c ON c.customer_key = s.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders ;
