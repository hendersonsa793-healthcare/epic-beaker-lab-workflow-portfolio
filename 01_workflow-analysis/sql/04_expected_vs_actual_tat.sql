-- ============================================
-- 04_expected_vs_actual_tat.sql
-- Purpose: Compare actual TAT against modeled expected TAT
-- Context: Identifies workflow segments exceeding expected performance
-- ============================================

WITH expected_tat_model AS (
    SELECT
        *,
        CASE
            WHEN test_name = 'Blood Culture' THEN 48
            WHEN test_name = 'Urine Culture' THEN 24
            WHEN test_name = 'Wound Culture' THEN 48
            WHEN test_name = 'PCR Respiratory Panel' THEN 2
            ELSE 24
        END AS expected_tat_hours
    FROM microbiology_orders
)

SELECT
    test_name,
    patient_location,
    priority,

    COUNT(*) AS order_count,

    ROUND(AVG(tat_total_hours)::numeric, 2) AS avg_actual_tat_hours,
    ROUND(AVG(expected_tat_hours)::numeric, 2) AS avg_expected_tat_hours,
    ROUND(AVG(tat_total_hours - expected_tat_hours)::numeric, 2) AS avg_tat_delta_hours

FROM expected_tat_model
GROUP BY
    test_name,
    patient_location,
    priority
ORDER BY
    avg_tat_delta_hours DESC;
