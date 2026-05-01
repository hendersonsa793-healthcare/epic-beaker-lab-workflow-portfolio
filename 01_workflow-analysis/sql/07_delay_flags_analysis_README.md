## 07 – Delay Flags Analysis

### Objective
To summarize workflow delay flags by test type and identify which stages are most frequently associated with turnaround time delays.

### Approach
This query counts delay flags across each major workflow stage:
- collection
- transport
- laboratory processing
- result posting

The results are grouped by test type and paired with average total TAT.

### Analyst Interpretation
Delay flags help translate raw time intervals into operational categories. By comparing flag frequency across tests, analysts can identify whether delays are concentrated in a specific workflow stage or distributed across the full order-to-result lifecycle.

### Operational Relevance
For Epic Beaker, LIS, or post-go-live stabilization work, this type of analysis can support targeted troubleshooting, dashboard design, and communication with operational leaders.
