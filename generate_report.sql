-- generate_report.sql
-- Author: Ali Abdi
-- Date: 2025-05-13

/* Fetch monthly sales totals per region */
SELECT
  region,
  SUM(amount) AS total_sales
FROM sales
WHERE sale_date >= '2025-01-01'
  AND sale_date <  '2025-02-01'
GROUP BY region
ORDER BY total_sales DESC;
