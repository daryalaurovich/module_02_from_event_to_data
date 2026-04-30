WITH shop_metrics AS (
    SELECT
        countries.country_name,
        shops.shop_id,
        shops.address,
        count(sales.sales_id) AS total_sales_count,
        sum(sales.total_price) AS total_sales_amount
    FROM
        sales
        JOIN employees ON sales.employee_id = employees.employee_id
        JOIN shops ON employees.shop_id = shops.shop_id
        JOIN cities ON shops.city_id = cities.city_id
        JOIN countries ON cities.country_id = countries.country_id
    GROUP BY
        countries.country_name,
        shops.shop_id,
        shops.address
    HAVING
        count(sales.sales_id) > 2
    ORDER BY
        total_sales_count DESC
)
SELECT
    country_name,
    shop_id,
    address,
    total_sales_count,
    total_sales_amount,
    sum(total_sales_amount) OVER (PARTITION BY country_name) AS country_total_sales,
    total_sales_amount / sum(total_sales_amount) OVER (PARTITION BY country_name) AS country_sale_share,
    ROW_NUMBER() OVER (PARTITION BY country_name) AS rank,
    sum(total_sales_amount) OVER (PARTITION BY country_name ORDER BY total_sales_amount DESC) AS country_rolling_total
FROM
    shop_metrics

