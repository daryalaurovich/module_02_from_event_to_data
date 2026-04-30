SELECT
    sales.transaction_number,
    sales.total_price,
    products.product_name,
    products.class
FROM
    sales
    JOIN products ON sales.product_id = products.product_id
WHERE (sales.total_price > 1500)
    AND (products.class = 'B')
ORDER BY
    sales.transaction_number