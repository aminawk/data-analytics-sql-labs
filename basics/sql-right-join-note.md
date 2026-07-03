# SQL JOIN Strategy in BI (Real-World Usage)

## Overview

In my Business Intelligence work, I primarily operate within a dimensional modelling structure where:

- Fact tables contain measurable business events (e.g. budgets, costs, hours)
- Dimension tables contain descriptive context (e.g. projects, statuses, customers)

Most reporting use cases require preserving the primary business entity (usually a dimension or fact table depending on the model) and enriching it with supporting datasets.

---

## LEFT JOIN (Primary Pattern in BI Work)

LEFT JOIN is the most commonly used join type in my work as it ensures the primary dataset is always preserved.

### Example Use Case
Return all projects and include budget information where available.

```sql
SELECT
    d.project_id,
    d.project_name,
    f.budget_amount
FROM dim_project d
LEFT JOIN fact_project_budget f
    ON d.project_id = f.project_id;
