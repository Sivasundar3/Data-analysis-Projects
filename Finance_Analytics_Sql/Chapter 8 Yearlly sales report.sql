
SELECT 
g.fiscal_year,
c.customer, 
ROUND(SUM(g.gross_price*s.sold_quantity),2) as gross_sales_amount_total
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code = c.customer_code
JOIN fact_gross_price g
ON 
 g.product_code = s.product_code and
 g.fiscal_year = get_fiscal_year(s.date)
WHERE s.customer_code = 90002002
GROUP BY g.fiscal_year