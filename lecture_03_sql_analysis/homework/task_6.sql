WITH table_cte AS (
    SELECT
        *
    FROM
        sales
        JOIN employees ON sales.employee_id = employees.employee_id
        JOIN cities ON employees.city_id = cities.city_id
        JOIN countries ON cities.country_id = countries.country_id
    WHERE
        countries.country_name = 'Germany'
)
SELECT
    DATE_TRUNC('month', sales_timestamp) AS sales_month,
    sum(total_price) AS monthly_revenue,
    coalesce(lag(sum(total_price)) OVER (ORDER BY DATE_TRUNC('month', sales_timestamp)), 0) AS prev_monthly_revenue,
    sum(total_price) - coalesce(lag(sum(total_price)) OVER (ORDER BY DATE_TRUNC('month', sales_timestamp)), 0) AS revenue_diff_vs_previous
FROM
    table_cte
GROUP BY
    DATE_TRUNC('month', sales_timestamp)
LIMIT 24
