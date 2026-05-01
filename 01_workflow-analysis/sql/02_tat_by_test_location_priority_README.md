## 02 – TAT by Test, Location, and Priority

### Objective
To evaluate turnaround time performance across microbiology orders by test type, patient location, and priority.

### Approach
This query groups microbiology orders by:
- patient location
- order priority
- test name

It calculates average turnaround time across each workflow stage:
- collection
- transport
- laboratory processing
- result posting
- total TAT

### Key Finding
Med Surg wound cultures demonstrated the highest total turnaround time. The largest contributor was laboratory processing time, which aligns with expected microbiology culture workflows due to incubation and bench processing requirements.

### Analyst Interpretation
Although longer laboratory processing time is expected for culture-based testing, this result identifies a workflow segment that should be monitored closely. Additional analysis should compare wound culture lab time across locations, shifts, and volumes to determine whether the elevated TAT reflects normal microbiology processing or an operational bottleneck.

### Operational Relevance
For an Epic Beaker or LIS analyst, this type of query helps identify where delays occur in the order-to-result lifecycle and supports targeted workflow review with laboratory operations teams.
