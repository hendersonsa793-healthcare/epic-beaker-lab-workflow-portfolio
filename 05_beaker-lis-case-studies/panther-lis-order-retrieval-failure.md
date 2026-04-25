# LIS Interface Issue – Order Retrieval Failure (Hologic Panther)

## Problem
The Hologic Panther molecular platform was unable to retrieve test orders from the LIS under specific accession conditions, preventing specimen processing.

---

## Environment
- Instrument: Hologic Panther  
- LIS: Sunquest  
- Workflow: Molecular diagnostics  
- Interface Type: Bidirectional (order query + result transmission)  

---

## Investigation
- Attempted LIS restart and manual specimen cross → initial failures observed  
- Partial reconfiguration restored connectivity but introduced intermittent order retrieval issues  
- Reviewed LIS protocol output and identified inconsistent message patterns  
- Compared accession-level structure across working vs failing cases  

Key observation:
- Orders failed when the accession contained a **single standalone test**
- Orders succeeded when:
  - Multiple tests were present on the accession  
  - The test was part of a panel/combination order  

---

## Root Cause (Hypothesis)
Interface behavior appears dependent on accession-level order structure.

When only a single test is present:
- Order retrieval or message parsing fails  
- Required fields may not be populated correctly in the interface message  

Likely causes:
- Configuration or mapping issue post vendor update  
- Dependency on multi-order or panel-based formatting within LIS interface logic  

---

## Action Taken
- Documented reproducible failure pattern  
- Captured LIS protocol examples showing inconsistent field population (e.g., pipe-delimited empty fields `|||||`)  
- Escalated findings to LIS team  
- LIS escalated to vendor (Sunquest) for further investigation  

---

## Outcome
- Eliminated ambiguity in troubleshooting by isolating a specific failure condition  
- Enabled targeted escalation with clear reproducible criteria  
- Reduced time spent on repeated trial-and-error troubleshooting  

---

## Analyst Insight
This issue highlights how **accession structure and order configuration directly impact LIS–instrument interface behavior**.

Key takeaways:
- Interface logic may behave differently based on single vs multi-order accessions  
- Structurally valid messages can still fail if required fields are not populated  
- Post-update validation of interface configuration is critical  

From an Epic Beaker perspective, this reinforces the importance of:
- Order build design (standalone vs panel-based orders)  
- Interface validation across edge cases  
- Ensuring consistent data structure throughout the order-to-result lifecycle  
