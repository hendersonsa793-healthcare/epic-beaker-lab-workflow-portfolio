-- ============================================
-- 01_basic_table_review.sql
-- Purpose: Initial dataset exploration and validation
-- Context: Microbiology workflow TAT analysis
-- ============================================

-- Preview dataset structure
SELECT *
FROM microbiology_orders
LIMIT 50;

-- Validate total record count
SELECT COUNT(*) AS total_orders
FROM microbiology_orders;

-- Identify key categorical variables for segmentation
SELECT DISTINCT
    test_name,
    patient_location,
    priority,
    instrument
FROM microbiology_orders;
