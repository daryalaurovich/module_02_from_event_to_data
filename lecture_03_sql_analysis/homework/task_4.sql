SELECT
    products.product_name,
    sum(sales.total_price) AS total_revenue,
    avg(sales.total_price) AS avg_sale
FROM
    sales
    JOIN products ON sales.product_id = products.product_id
GROUP BY
    products.product_name
HAVING
    sum(sales.total_price) > 400000.00
ORDER BY
    total_revenue DESC
