# Ometria Business Data Analyst - Practical Assessment 1

## Project Overview

This repository contains the SQL solutions for the "Business Data Analyst Practical Assessment 1" provided by Ometria. The objective of this assessment is to evaluate SQL competence by addressing two distinct data analysis challenges focusing on customer behavior and purchase patterns.

**Author:** Alireza Abdi
**GitHub Repository:** `https://github.com/aliabdi064/Ometria-sql-scripts` 
**Date:** May 13, 2025 

---

## Assessment Tasks

The assessment consists of two SQL challenges as detailed in the `problem_description.pdf` document.

### Task 1: Identify Top Repeat Customers

* **Objective:** Analyze customer behavior to identify the top 10 customers demonstrating strong recent buying behavior (last 90 days) in both consistency (at least 2 non-refunded purchases) and spending.
* **Output Requirements:** Display customer ID, full name, account age, total lifetime transactions, total 90-day transactions, total lifetime spending, and total 90-day spending. Refunded transactions are excluded from calculations.
* **Data Sources Used:** `Customer_profiles` and `Transactions` tables.
* **Solution File:** `generate_report.sql`
* **Solution Approach (based on typical solution for this task):**
    1.  Calculated 90-day spending and transaction counts from the `Transactions` table, filtering for at least two non-refunded transactions per customer within the last 90 days.
    2.  Calculated lifetime spending and transaction counts from the `Transactions` table, excluding refunded transactions.
    3.  Joined these aggregated statistics with the `Customer_profiles` table to retrieve customer details and account creation date.
    4.  Calculated account age based on the `account_created` date.
    5.  Ordered the results by 90-day spending in descending order and selected the top 10 customers.

### Task 2: Customer Purchase Rank by Month

* **Objective:** Analyze the evolution of customer purchasing behavior by identifying the top 3 spenders for each month, excluding test payments.
* **Output Requirements:** Display the month, customer identifier (implicitly), and their total spending for that month.
* **Data Source Used:** `Orders` table.
* **Solution File:** `generate_report_Task2.sql`
* **Solution Approach (based on typical solution for this task):**
    1.  Aggregated total spending for each customer per month from the `Orders` table, ensuring test payments were excluded.
    2.  Used a window function (e.g., `RANK() OVER (PARTITION BY month ORDER BY total_monthly_spending DESC)`) to rank customers within each month based on their spending.
    3.  Filtered the ranked results to include only the top 3 customers for each month.
    4.  Ordered the final output by month and then by rank.

---

## Repository Contents

* **`problem_description.pdf`**: The official PDF document from Ometria outlining the practical assessment tasks, requirements, and data schema.
* **`generate_report.sql`**: SQL script containing the solution for Task 1 (Identify Top Repeat Customers).
* **`generate_report_Task2.sql`**: SQL script containing the solution for Task 2 (Customer Purchase Rank by Month).
* **`README.md`**: This file, providing an overview of the project, tasks, solution approaches, and contents.
* **`.gitignore`** (Optional - if you added one): Specifies intentionally untracked files that Git should ignore.

---

## Technical Information

<<<<<<< HEAD
* **SQL Dialect Used:** [** SQL dialect you used, e.g., 'PostgreSQL', 'MySQL', 'SQL Server', 'SQLite'. Please ensure this matches the syntax in your .sql files.** For example, if you used `CURRENT_DATE - INTERVAL '90 day'`, that's common in PostgreSQL. If you used `STRFTIME`, that's common in SQLite. Mention any specific functions that might be dialect-dependent if relevant.]
* **Key Tables & Schema (as per `problem_description.pdf`):**
    * `Customer_profiles`: Contains customer identifiers, names, signup channels, and account creation dates.
    * `Transactions`: Contains transaction IDs, customer IDs, transaction dates, order totals, and refund status.
    * `Orders` (for Task 2): Contains payment IDs, customer IDs, payment dates, amounts, and test payment status.
=======
* **SQL Dialect Used:** [**'PostgreSQL', 'MySQL', 'T-SQL', or 'Standard SQL'**]
* **Key Tables & Schema:**
    * `Customer_profiles`: Contains customer identifiers, names, signup channels, and account creation dates. [cite: 10, 11]
    * `Transactions`: Contains transaction IDs, customer IDs, transaction dates, order totals, and refund status. [cite: 12, 13]
    * `Orders` (for Task 2): Contains payment IDs, customer IDs, payment dates, amounts, and test payment status. [cite: 16, 17]
>>>>>>> 9bd58c4f351171c3b84731c45b1e7f844b4c7b04

---

## How to Use

1.  Ensure you have access to a database instance populated with data according to the schema and requirements outlined in `problem_description.pdf`.
2.  The SQL scripts (`generate_report.sql`, `generate_report_Task2.sql`) can be executed independently against the database using a compatible SQL client or tool.
3.  Review the comments within each SQL script for any specific implementation details or dialect considerations.


