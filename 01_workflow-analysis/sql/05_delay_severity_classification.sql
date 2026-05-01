-- ============================================
-- 05_delay_severity_classification.sql
-- Purpose: Classify orders by turnaround time delay severity
-- Context: Converts expected vs actual TAT delta into operational categories
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
),

delay_classification AS (
    SELECT
        order_id,
        test_name,
        patient_location,
        priority,
        tat_total_hours,
        expected_tat_hours,
        ROUND((tat_total_hours - expected_tat_hours)::numeric, 2) AS tat_delta_hours,

        CASE
            WHEN tat_total_hours - expected_tat_hours > 4 THEN 'SEVERE_DELAY'
            WHEN tat_total_hours - expected_tat_hours > 2 THEN 'MODERATE_DELAY'
            WHEN tat_total_hours > expected_tat_hours THEN 'MINOR_DELAY'
            ELSE 'ON_TIME'
        END AS delay_severity
    FROM expected_tat_model
)

SELECT
    *
FROM delay_classification
ORDER BY
    tat_delta_hours DESC;
