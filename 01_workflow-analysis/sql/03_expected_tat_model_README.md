## 03 – Expected TAT Model

### Objective
To create an expected turnaround time model for microbiology orders when expected TAT is not directly stored in the dataset.

### Approach
A CTE was used to assign expected TAT values based on test type. This simulates how analysts may derive expected performance targets from operational standards, test build logic, service-line expectations, or laboratory policy.

### Analyst Interpretation
Expected TAT is not always available as a clean field in operational data. In those cases, analysts often need to create a reference model that allows actual performance to be compared against expected workflow behavior.

### Operational Relevance
For Epic Beaker, LIS, or Clarity-style analysis, this step mirrors the process of connecting transactional order data to operational expectations. It creates the foundation for later delta analysis, delay severity classification, and workflow performance review.
