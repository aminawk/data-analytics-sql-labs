# SQL Interview Pattern Cheat Sheet

This document summarises the most common SQL patterns seen in StrataScratch, DataLemur, and interview questions.

---

# 1. Basic Filtering

## Question
Return all users who have Python skill.

```sql
SELECT *
FROM candidates
WHERE skill = 'Python';
```

---

# 2. Multiple Value Filtering

## Question
Return users with Python, Tableau, or SQL skills.

```sql
SELECT *
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'SQL');
```

---

# 3. Group By + Count

## Question
Count number of users per skill.

```sql
SELECT skill, COUNT(*) AS total_users
FROM candidates
GROUP BY skill;
```

---

# 4. "Has ALL values" (Very Important Pattern)

## Question
Find candidates who have Python, Tableau, AND SQL.

```sql
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'SQL')
GROUP BY candidate_id
HAVING COUNT(DISTINCT skill) = 3;
```

---

# 5. MAX per Group

## Question
Find highest salary per department.

```sql
SELECT department, MAX(salary) AS max_salary
FROM employees
GROUP BY department;
```

---

# 6. Difference Between Two Groups

## Question
Difference between max salary in Marketing and Engineering.

```sql
SELECT
    ABS(
        MAX(CASE WHEN department = 'marketing' THEN salary END)
        -
        MAX(CASE WHEN department = 'engineering' THEN salary END)
    ) AS salary_difference
FROM employees;
```

---

# 7. CASE WHEN (Category Split)

## Question
Count laptop vs mobile users.

```sql
SELECT
    COUNT(CASE WHEN device = 'laptop' THEN user_id END) AS laptop_users,
    COUNT(CASE WHEN device = 'mobile' THEN user_id END) AS mobile_users
FROM sessions;
```

---

# 8. DISTINCT Users per Category

## Question
Count unique users per device type.

```sql
SELECT
    COUNT(DISTINCT CASE WHEN device = 'laptop' THEN user_id END) AS laptop_users,
    COUNT(DISTINCT CASE WHEN device = 'mobile' THEN user_id END) AS mobile_users
FROM sessions;
```

---

# 9. Users Who Meet BOTH Conditions

## Question
Find users who used both laptop and mobile.

```sql
SELECT user_id
FROM sessions
GROUP BY user_id
HAVING
    COUNT(DISTINCT CASE WHEN device = 'laptop' THEN 1 END) > 0
    AND COUNT(DISTINCT CASE WHEN device = 'mobile' THEN 1 END) > 0;
```

---

# 10. Percentage of Users Matching Condition

## Question
Percentage of users who used both laptop and mobile.

```sql
WITH user_flags AS (
    SELECT user_id
    FROM sessions
    GROUP BY user_id
    HAVING
        COUNT(DISTINCT CASE WHEN device = 'laptop' THEN 1 END) > 0
        AND COUNT(DISTINCT CASE WHEN device = 'mobile' THEN 1 END) > 0
)

SELECT
    100.0 * COUNT(*) /
    (SELECT COUNT(DISTINCT user_id) FROM sessions) AS percentage
FROM user_flags;
