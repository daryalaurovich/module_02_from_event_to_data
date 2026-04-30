SELECT
    employees.first_name,
    employees.last_name,
    shops.address,
    sales.total_price
FROM
    employees
    JOIN shops ON employees.shop_id = shops.shop_id
    JOIN sales ON employees.employee_id = sales.employee_id
WHERE
    sales.total_price = (
        SELECT
            max(sales.total_price)
        FROM
            sales)