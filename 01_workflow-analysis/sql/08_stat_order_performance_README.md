## 08 – STAT Order Performance

### Objective
To compare turnaround time performance between STAT and routine microbiology orders.

### Approach
This query groups orders by priority and calculates average turnaround time across each workflow stage:
- collection
- transport
- laboratory processing
- result posting
- total TAT

It also counts STAT delay flags.

### Analyst Interpretation
Priority-based TAT analysis helps determine whether STAT orders are moving through the workflow faster than routine orders. If STAT orders have unexpectedly high TAT, the issue may reflect collection delays, transport delays, queueing at the bench, or result verification/release problems.

### Operational Relevance
For Epic Beaker and LIS workflow support, STAT performance is especially important because delayed high-priority results can affect clinical decision-making, escalation workflows, and operational trust in the system.
