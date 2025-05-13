-- generate_report.sql
-- Author: Ali Abdi
-- Date: 2025-05-13

/* Fetch monthly sales totals per region */

WITH Customer90DayStats AS (
    -- Calculate total spending and transaction count for each customer in the last 90 days
    SELECT
        customer_id,
        SUM(order_grand_total) AS total_revenue_last_90_days,
        COUNT(txn_id) AS num_transactions_last_90_days
    FROM
        Transactions
    WHERE
        is_refunded = FALSE
        -- Define "last 90 days": transactions from 90 days ago up to and including today.
        -- The exact date function may vary by SQL dialect:
        -- PostgreSQL: txn_date > (CURRENT_DATE - INTERVAL '90 days') AND txn_date <= CURRENT_DATE
        -- MySQL: txn_date > DATE_SUB(CURRENT_DATE(), INTERVAL 90 DAY) AND txn_date <= CURRENT_DATE()
        -- SQL Server: txn_date > DATEADD(day, -90, GETDATE()) AND txn_date <= GETDATE()
        -- SQLite: txn_date > date('now', '-90 days') AND txn_date <= date('now')
        AND txn_date > (CURRENT_DATE - INTERVAL '90 day') -- Using a common syntax, adjust if needed
        AND txn_date <= CURRENT_DATE
    GROUP BY
        customer_id
    HAVING
        COUNT(txn_id) >= 2 -- Customers must have at least 2 non-refunded purchases in the period
),
CustomerLifetimeStats AS (
    -- Calculate total lifetime spending and transaction count for each customer
    SELECT
        customer_id,
        SUM(order_grand_total) AS total_lifetime_spending,
        COUNT(txn_id) AS total_lifetime_transactions
    FROM
        Transactions
    WHERE
        is_refunded = FALSE -- Exclude refunded transactions from lifetime calculations
    GROUP BY
        customer_id
)
-- Final selection of top 10 customers
SELECT
    cp.customer_id,
    cp."Full Name", -- Use quotes if the column name contains spaces or is a reserved keyword
    -- Calculate account age in days. The function depends on the SQL dialect:
    -- PostgreSQL: (CURRENT_DATE - cp.account_created) or EXTRACT(DAY FROM AGE(cp.account_created))
    -- MySQL: DATEDIFF(CURRENT_DATE(), cp.account_created)
    -- SQL Server: DATEDIFF(day, cp.account_created, GETDATE())
    -- SQLite: (JULIANDAY('now') - JULIANDAY(cp.account_created))
    (CURRENT_DATE - cp.account_created) AS account_age_days, -- Example for PostgreSQL / some dialects
    cls.total_lifetime_transactions,
    c90.num_transactions_last_90_days,
    cls.total_lifetime_spending,
    c90.total_revenue_last_90_days
FROM
    Customer90DayStats c90
JOIN
    Customer_profiles cp ON c90.customer_id = cp.customer_id
JOIN
    CustomerLifetimeStats cls ON c90.customer_id = cls.customer_id -- Join with lifetime stats
ORDER BY
    c90.total_revenue_last_90_days DESC -- Identify top customers by 90-day revenue
LIMIT 10;
