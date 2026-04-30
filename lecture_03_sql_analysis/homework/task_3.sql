SELECT
    countries.country_name,
    count(shop_id) AS shops_count
FROM
    shops
    JOIN cities ON shops.city_id = cities.city_id
    JOIN countries ON cities.country_id = countries.country_id
GROUP BY
    countries.country_name
ORDER BY
    shops_count DESC
