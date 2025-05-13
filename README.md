# Ometria Business Data Analyst - Practical Assessment 1

## Project Overview

This repository contains the SQL solutions for the "Business Data Analyst Practical Assessment 1" provided by Ometria. The objective of this assessment is to evaluate SQL competence through two distinct data analysis challenges. [cite: 2]

**Author:** Alireza Abdi
**GitHub Repository:** `https://github.com/aliabdi064/Ometria-sql-scripts` 
**Date:** May 13, 2025 

---

## Assessment Tasks

The assessment consists of two SQL challenges as detailed in the `problem_description.pdf.pdf` document[cite: 2]:

### Task 1: Identify Top Repeat Customers [cite: 4]

* **Objective:** Analyze customer behavior in a subscription-based business to identify customers demonstrating strong recent buying behavior in both consistency and spending. [cite: 5]
* **Requirements:**
    * Identify the top 10 customers by total revenue spent in the last 90 days. [cite: 7]
    * Exclude refunded transactions. [cite: 8]
    * Include only customers with at least 2 non-refunded purchases within the 90-day period. [cite: 8]
    * Display the account age, total number of lifetime transactions, total number of transactions in the last 90 days, total lifetime spending, and total spending in the last 90 days for these top customers. [cite: 9]
* **Data Sources:** `Customer_profiles` and `Transactions` tables. [cite: 6, 10, 12]
* **Solution File:** `task_1_top_repeat_customers.sql` 

### Task 2: Customer Purchase Rank by Month [cite: 14]

* **Objective:** Analyze the evolution of customer purchasing behavior by identifying the top monthly spenders. [cite: 14]
* **Requirements:**
    * For each month with available order data, identify the top 3 customers based on their total spending within that specific month. [cite: 15]
    * Exclude test payments. [cite: 15]
    * Output the month, customer identifier (implicitly), and their total spending for that month. [cite: 16]
* **Data Source:** `Orders` table. [cite: 15, 16]
* **Solution File:** `task_2_monthly_purchase_rank.sql` 

---

## Repository Contents

* **`problem_description.pdf.pdf`**: The official PDF document from Ometria outlining the practical assessment tasks and data schema.
* **`task_1_top_repeat_customers.sql`** (or your filename): SQL query to address Task 1.
* **`task_2_monthly_purchase_rank.sql`** (or your filename): SQL query to address Task 2.
* **`README.md`**: This file, providing an overview of the project and its contents.
* **`.gitignore`** (if added): Specifies intentionally untracked files that Git should ignore.

---

## Technical Information

* **SQL Dialect Used:** [**Specify SQL dialect you used, e.g., 'PostgreSQL', 'MySQL', 'T-SQL', or 'Standard SQL'**]
* **Key Tables & Schema:**
    * `Customer_profiles`: Contains customer identifiers, names, signup channels, and account creation dates. [cite: 10, 11]
    * `Transactions`: Contains transaction IDs, customer IDs, transaction dates, order totals, and refund status. [cite: 12, 13]
    * `Orders` (for Task 2): Contains payment IDs, customer IDs, payment dates, amounts, and test payment status. [cite: 16, 17]

---

