-- Day 3: Used-Car Deal Detector
-- Identifies listings that are significantly below or above
-- the median price of comparable vehicles.

WITH mileage_banded AS (
    SELECT
        manufacturer,
        model,
        year,
        mileage,
        price,

        CASE
            WHEN mileage < 25000 THEN '0-25K'
            WHEN mileage < 50000 THEN '25K-50K'
            WHEN mileage < 75000 THEN '50K-75K'
            WHEN mileage < 100000 THEN '75K-100K'
            ELSE '100K+'
        END AS mileage_band

    FROM cars
    WHERE mileage IS NOT NULL
      AND price > 1000
),

benchmarks AS (
    SELECT
        manufacturer,
        model,
        year,
        mileage_band,

        ROUND(
            (
                PERCENTILE_CONT(0.5)
                WITHIN GROUP (ORDER BY price)
            )::numeric,
            2
        ) AS fair_price,

        COUNT(*) AS comparable_count

    FROM mileage_banded

    GROUP BY
        manufacturer,
        model,
        year,
        mileage_band

    HAVING COUNT(*) >= 5
),

deal_detection AS (
    SELECT
        c.manufacturer,
        c.model,
        c.year,
        c.mileage,
        c.mileage_band,
        c.price,

        b.fair_price,
        b.comparable_count,

        ROUND(
            c.price - b.fair_price,
            2
        ) AS price_difference,

        ROUND(
            (
                (c.price - b.fair_price)
                / b.fair_price
            ) * 100,
            2
        ) AS price_difference_pct

    FROM mileage_banded c

    JOIN benchmarks b
        ON c.manufacturer = b.manufacturer
        AND c.model = b.model
        AND c.year = b.year
        AND c.mileage_band = b.mileage_band
)

SELECT
    manufacturer,
    model,
    year,
    mileage,
    mileage_band,
    price,
    fair_price,
    comparable_count,
    price_difference,
    price_difference_pct,

    CASE
        WHEN price_difference_pct <= -10
            THEN 'Undervalued'

        WHEN price_difference_pct > 10
            THEN 'Overpriced'

        ELSE 'Fair'
    END AS deal_status,

    CASE
        WHEN ABS(price_difference_pct) >= 25
            THEN 'Strong'

        WHEN ABS(price_difference_pct) >= 15
            THEN 'Moderate'

        ELSE 'Weak'
    END AS deal_strength

FROM deal_detection

ORDER BY
    price_difference_pct;