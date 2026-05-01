## 05 – Delay Severity Classification

### Objective
To classify individual microbiology orders by turnaround time delay severity.

### Approach
This query compares actual TAT to modeled expected TAT and assigns each order to a severity category:
- **ON_TIME**
- **MINOR_DELAY**
- **MODERATE_DELAY**
- **SEVERE_DELAY**

### Analyst Interpretation
Delay classification allows row-level workflow events to be translated into operational risk categories. This makes it easier to identify which orders require deeper review rather than treating all delays equally.

### Operational Relevance
For Epic Beaker, LIS, or clinical systems work, this type of classification can support dashboard logic, workqueue prioritization, service-line reporting, and post-go-live stabilization monitoring.
