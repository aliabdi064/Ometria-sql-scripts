WITH MonthlyCustomerSpending AS (
    -- Calculate total spending for each customer per month, excluding test payments
    SELECT
        STRFTIME('%Y-%m', payment_date) AS payment_month, -- Extracts year and month, e.g., '2023-01'
        customer_id,
        SUM(amount) AS total_monthly_spending
    FROM
        Orders
    WHERE
        is_test_payment = FALSE -- Exclude test payments
    GROUP BY
        payment_month,
        customer_id
),
RankedMonthlySpending AS (
    -- Rank customers within each month based on their total spending
    SELECT
        payment_month,
        customer_id,
        total_monthly_spending,
        RANK() OVER (PARTITION BY payment_month ORDER BY total_monthly_spending DESC) AS customer_rank
        -- RANK() is used here to handle ties; if two customers have the same spending for the 3rd spot, both will be included.
        -- If strict top 3 (e.g., only 3 rows even with ties), ROW_NUMBER() could be used, but RANK() is generally preferred for "top N" scenarios.
    FROM
        MonthlyCustomerSpending
)
-- Select the top 3 customers for each month
SELECT
    payment_month,
    customer_id,
    total_monthly_spending
FROM
    RankedMonthlySpending
WHERE
    customer_rank <= 3 -- Filter for the top 3 ranked customers in each month
ORDER BY
    payment_month ASC, -- Order by month chronologically
    customer_rank ASC;   -- Within each month, order by rank (highest spender first)
