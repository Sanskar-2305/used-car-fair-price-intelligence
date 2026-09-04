-- =====================================================
-- FAIR MARKET PRICE ENGINE
-- =====================================================

WITH comparable_cars AS (
    SELECT
        manufacturer,
        model,
        year,
        mileage,
        price,

        -- Fair price based on same manufacturer + model + year
        ROUND(
            AVG(price) OVER (
                PARTITION BY manufacturer, model, year
            ),
            2
        ) AS fair_price,

        COUNT(*) OVER (
            PARTITION BY manufacturer, model, year
        ) AS comparable_count

    FROM cars
)

SELECT
    manufacturer,
    model,
    year,
    mileage,
    price,
    fair_price,
    comparable_count,

    ROUND(price - fair_price, 2) AS price_difference,

    ROUND(
        ((price - fair_price) / fair_price) * 100,
        2
    ) AS price_difference_pct

FROM comparable_cars
WHERE comparable_count >= 10
LIMIT 50;