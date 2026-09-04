-- =====================================================
-- MILEAGE-ADJUSTED FAIR PRICE + DEAL DETECTOR
-- =====================================================

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
),

group_benchmarks AS (
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
),

deal_detection AS (
    SELECT
        c.manufacturer,
        c.model,
        c.year,
        c.mileage,
        c.mileage_band,
        c.price,

        g.fair_price,
        g.comparable_count,

        ROUND(
            c.price - g.fair_price,
            2
        ) AS price_difference,

        ROUND(
            ((c.price - g.fair_price) / g.fair_price) * 100,
            2
        ) AS price_difference_pct

    FROM mileage_banded c

    JOIN group_benchmarks g
        ON c.manufacturer = g.manufacturer
        AND c.model = g.model
        AND c.year = g.year
        AND c.mileage_band = g.mileage_band

    WHERE g.comparable_count >= 5
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
    END AS deal_status

FROM deal_detection

ORDER BY price_difference_pct

LIMIT 100;