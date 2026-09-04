-- Day 3: PostgreSQL Data Validation

-- 1. Total records
SELECT COUNT(*) AS total_cars
FROM cars;


-- 2. Price validation
SELECT
    COUNT(*) AS total_cars,
    COUNT(price) AS cars_with_price,
    MIN(price) AS min_price,
    MAX(price) AS max_price,
    ROUND(AVG(price), 2) AS avg_price
FROM cars;


-- 3. Missing mileage
SELECT
    COUNT(*) AS total_cars,
    COUNT(mileage) AS cars_with_mileage,
    COUNT(*) - COUNT(mileage) AS missing_mileage
FROM cars;


-- 4. Invalid prices
SELECT COUNT(*) AS invalid_prices
FROM cars
WHERE price <= 0;


-- 5. Vehicle distribution by manufacturer
SELECT
    manufacturer,
    COUNT(*) AS vehicle_count
FROM cars
GROUP BY manufacturer
ORDER BY vehicle_count DESC;