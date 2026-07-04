# SQL Interview Patterns Master Document (50 Patterns)

This document contains 50 of the most common SQL interview patterns seen in StrataScratch, DataLemur, LeetCode, and analytics interviews.

---

# 1. Basic SELECT
```sql
SELECT * FROM table;
```

# 2. WHERE filter
```sql
SELECT * FROM table
WHERE condition;
```

# 3. IN filter
```sql
SELECT * FROM table
WHERE column IN ('A','B','C');
```

# 4. AND / OR conditions
```sql
SELECT * FROM table
WHERE a = 1 AND b = 2;
```

# 5. NULL filtering
```sql
WHERE column IS NOT NULL;
```

# 6. BETWEEN range
```sql
WHERE column BETWEEN 10 AND 20;
```

# 7. ORDER BY sorting
```sql
ORDER BY column DESC;
```

# 8. LIMIT top N
```sql
SELECT * FROM table
LIMIT 10;
```

# 9. COUNT rows
```sql
SELECT COUNT(*) FROM table;
```

# 10. COUNT with condition
```sql
COUNT(CASE WHEN condition THEN 1 END)
```

# 11. DISTINCT values
```sql
SELECT DISTINCT column FROM table;
```

# 12. GROUP BY basic
```sql
SELECT col, COUNT(*)
FROM table
GROUP BY col;
```

# 13. HAVING filter after aggregation
```sql
HAVING COUNT(*) > 1;
```

# 14. MAX per group
```sql
SELECT col, MAX(val)
FROM table
GROUP BY col;
```

# 15. MIN per group
```sql
SELECT col, MIN(val)
FROM table
GROUP BY col;
```

# 16. SUM per group
```sql
SELECT col, SUM(val)
FROM table
GROUP BY col;
```

# 17. Average per group
```sql
SELECT col, AVG(val)
FROM table
GROUP BY col;
```

# 18. GROUP BY multiple columns
```sql
GROUP BY col1, col2;
```

# 19. CASE WHEN
```sql
CASE WHEN condition THEN value ELSE value END
```

# 20. Conditional aggregation
```sql
MAX(CASE WHEN condition THEN value END)
```

# 21. Split categories (counts)
```sql
COUNT(CASE WHEN type='A' THEN 1 END)
```

# 22. LEFT JOIN
```sql
FROM a
LEFT JOIN b ON a.id = b.id;
```

# 23. INNER JOIN
```sql
FROM a
JOIN b ON a.id = b.id;
```

# 24. RIGHT JOIN
```sql
FROM a
RIGHT JOIN b ON a.id = b.id;
```

# 25. JOIN multiple tables
```sql
FROM a
JOIN b ON ...
JOIN c ON ...
```

# 26. Duplicate detection
```sql
GROUP BY col
HAVING COUNT(*) > 1;
```

# 27. Remove duplicates
```sql
SELECT DISTINCT *
```

# 28. Top N per group (concept)
Use ROW_NUMBER()

# 29. ROW_NUMBER()
```sql
ROW_NUMBER() OVER (PARTITION BY col ORDER BY val DESC)
```

# 30. RANK()
```sql
RANK() OVER (PARTITION BY col ORDER BY val DESC)
```

# 31. DENSE_RANK()
```sql
DENSE_RANK() OVER (...)
```

# 32. Top 1 per group
Use ROW_NUMBER() = 1

# 33. Running total
```sql
SUM(val) OVER (ORDER BY date)
```

# 34. Moving average
```sql
AVG(val) OVER (ORDER BY date ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
```

# 35. Lead function
```sql
LEAD(column) OVER (ORDER BY date)
```

# 36. Lag function
```sql
LAG(column) OVER (ORDER BY date)
```

# 37. Difference between rows
```sql
value - LAG(value) OVER (...)
```

# 38. Percentage of total
```sql
value * 1.0 / SUM(value)
```

# 39. Percent of group
```sql
COUNT(*) / SUM(COUNT(*)) OVER ()
```

# 40. EXISTS
```sql
WHERE EXISTS (SELECT 1 ...)
```

# 41. NOT EXISTS
```sql
WHERE NOT EXISTS (...)
```

# 42. Subquery filter
```sql
WHERE col IN (SELECT col FROM ...)
```

# 43. CTE
```sql
WITH cte AS (
 SELECT ...
)
SELECT * FROM cte;
```

# 44. Multiple CTEs
```sql
WITH cte1 AS (...),
cte2 AS (...)
SELECT * FROM cte2;
```

# 45. Highest value overall
```sql
SELECT MAX(column) FROM table;
```

# 46. Difference between groups
```sql
ABS(MAX(CASE WHEN ...)-MAX(CASE WHEN ...))
```

# 47. “Has ALL items”
```sql
GROUP BY id
HAVING COUNT(DISTINCT item) = n;
```

# 48. Pivot-style aggregation
```sql
SUM(CASE WHEN category='A' THEN value END)
```

# 49. Date filtering
```sql
WHERE date >= '2024-01-01'
```

# 50. Percent + aggregation final pattern
```sql
SELECT 100.0 * COUNT(*) / (SELECT COUNT(*) FROM table)
```
