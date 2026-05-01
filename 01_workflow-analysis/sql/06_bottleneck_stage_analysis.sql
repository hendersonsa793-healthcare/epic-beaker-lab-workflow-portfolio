-- ============================================
-- 06_bottleneck_stage_analysis.sql
-- Purpose: Identify dominant turnaround time stage by test and location
-- Context: Supports workflow bottleneck detection across the order-to-result lifecycle
-- ============================================

SELECT
    test_name,
    patient_location,

    COUNT(*) AS order_count,

    ROUND(AVG(tat_collection_min)::numeric, 1) AS avg_collection_min,
    ROUND(AVG(tat_transport_min)::numeric, 1) AS avg_transport_min,
    ROUND(AVG(tat_lab_min)::numeric, 1) AS avg_lab_min,
    ROUND(AVG(tat_result_post_min)::numeric, 1) AS avg_result_post_min,
    ROUND(AVG(tat_total_min)::numeric, 1) AS avg_total_min,

    CASE
        WHEN AVG(tat_collection_min) >= AVG(tat_transport_min)
         AND AVG(tat_collection_min) >= AVG(tat_lab_min)
         AND AVG(tat_collection_min) >= AVG(tat_result_post_min)
            THEN 'COLLECTION'

        WHEN AVG(tat_transport_min) >= AVG(tat_collection_min)
         AND AVG(tat_transport_min) >= AVG(tat_lab_min)
         AND AVG(tat_transport_min) >= AVG(tat_result_post_min)
            THEN 'TRANSPORT'

        WHEN AVG(tat_lab_min) >= AVG(tat_collection_min)
         AND AVG(tat_lab_min) >= AVG(tat_transport_min)
         AND AVG(tat_lab_min) >= AVG(tat_result_post_min)
            THEN 'LAB_PROCESSING'

        ELSE 'RESULT_POSTING'
    END AS dominant_bottleneck_stage

FROM microbiology_orders
GROUP BY
    test_name,
    patient_location
ORDER BY
    avg_total_min DESC;
