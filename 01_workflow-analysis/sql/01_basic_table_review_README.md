## 01 – Basic Table Review

### Objective
To validate dataset structure and identify key variables for workflow segmentation prior to analysis.

### Approach
Initial queries were used to:
- preview dataset structure and confirm column availability
- validate total record count
- identify key categorical fields (test type, location, priority, instrument)

### Key Fields Identified
- **test_name** → primary driver of workflow variation
- **patient_location** → operational segmentation (Med Surg, ED, ICU)
- **priority** → STAT vs routine workflow impact
- **instrument** → potential system-level performance differences

### Outcome
This step confirmed that the dataset supports workflow-based analysis of turnaround time across multiple dimensions. These fields were used in subsequent queries to evaluate performance and identify bottlenecks.
