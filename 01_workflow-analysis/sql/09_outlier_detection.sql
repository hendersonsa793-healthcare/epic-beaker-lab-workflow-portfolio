-- ============================================
-- 09_outlier_detection.sql
-- Purpose: Identify high TAT outliers using statistical thresholds
-- Context: Surfaces extreme delays for targeted investigation
-- ============================================

WITH tat_stats AS (
    SELECT
        AVG(tat_total_hours) AS avg_tat,
        STDDEV(tat_total_hours) AS stddev_tat
    FROM microbiology_orders
),

outliers AS (
    SELECT
        m.order_id,
        m.test_name,
        m.patient_location,
        m.priority,
        m.tat_total_hours,
        s.avg_tat,
        s.stddev_tat,

        (m.tat_total_hours - s.avg_tat) AS deviation_from_mean

    FROM microbiology_orders m
    CROSS JOIN tat_stats s
    WHERE m.tat_total_hours > (s.avg_tat + 2 * s.stddev_tat)
)

SELECT
    *
FROM outliers
ORDER BY
    deviation_from_mean DESC;
