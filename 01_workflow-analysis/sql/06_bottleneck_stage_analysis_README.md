## 06 – Bottleneck Stage Analysis

### Objective
To identify which stage of the microbiology workflow contributes most to total turnaround time by test and patient location.

### Approach
This query calculates average time spent in each workflow stage:
- collection
- transport
- laboratory processing
- result posting

A CASE statement is then used to identify the dominant bottleneck stage for each test/location combination.

### Analyst Interpretation
This analysis helps move beyond identifying that a workflow is delayed and instead asks where the delay is occurring. For example, a high total TAT driven by laboratory processing suggests a different operational issue than one driven by specimen transport or result posting.

### Operational Relevance
For Epic Beaker and LIS workflow review, bottleneck analysis supports targeted intervention. Collection delays may involve nursing workflows, transport delays may involve courier or pneumatic tube routing, lab processing delays may involve bench workflow or incubation requirements, and result posting delays may involve verification, interface, or release logic.
