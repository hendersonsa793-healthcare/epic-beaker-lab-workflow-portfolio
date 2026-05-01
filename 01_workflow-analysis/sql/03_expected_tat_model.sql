-- ============================================
-- 03_expected_tat_model.sql
-- Purpose: Create an expected TAT model using test-specific rules
-- Context: Expected TAT is not stored directly in the source dataset
-- ============================================

WITH expected_tat_model AS (
    SELECT
        order_id,
        test_name,
        patient_location,
        priority,
        tat_total_hours,

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
    order_id,
    test_name,
    patient_location,
    priority,
    tat_total_hours,
    expected_tat_hours

FROM expected_tat_model
ORDER BY
    test_name,
    patient_location;
