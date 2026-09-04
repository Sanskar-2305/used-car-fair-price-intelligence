-- Day 3: Market Analysis


SELECT
    manufacturer,
    COUNT(*) AS vehicle_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY price)::numeric,
        2
    ) AS median_price
FROM cars
GROUP BY manufacturer
HAVING COUNT(*) >= 100
ORDER BY median_price DESC;


SELECT
    vehicle_age,
    COUNT(*) AS vehicle_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY price)::numeric,
        2
    ) AS median_price
FROM cars
GROUP BY vehicle_age
HAVING COUNT(*) >= 100
ORDER BY vehicle_age;


SELECT
    manufacturer,
    year,
    COUNT(*) AS vehicle_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY price)::numeric,
        2
    ) AS median_price
FROM cars
GROUP BY manufacturer, year
HAVING COUNT(*) >= 100
ORDER BY manufacturer, year;


SELECT
    has_accident,
    COUNT(*) AS vehicle_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY price)::numeric,
        2
    ) AS median_price
FROM cars
GROUP BY has_accident
ORDER BY has_accident;


SELECT
    is_one_owner,
    COUNT(*) AS vehicle_count,
    ROUND(AVG(price), 2) AS avg_price,
    ROUND(
        PERCENTILE_CONT(0.5)
        WITHIN GROUP (ORDER BY price)::numeric,
        2
    ) AS median_price
FROM cars
GROUP BY is_one_owner
ORDER BY is_one_owner;