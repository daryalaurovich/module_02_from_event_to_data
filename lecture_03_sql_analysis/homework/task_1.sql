SELECT
    sales.sales_id,
    products.product_name,
    categories.category_name,
    shops.address
FROM
    sales
    JOIN products ON sales.sales_id = products.product_id
    JOIN categories ON products.category_id = categories.category_id
    JOIN employees ON sales.employee_id = employees.employee_id
    JOIN shops ON employees.shop_id = shops.shop_id
limit 10;