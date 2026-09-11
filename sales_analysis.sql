-- Sales Analytics Dashboard
-- Example SQL written for a table named sales.

-- 1. Overall KPIs
SELECT
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(units_sold) AS total_units_sold,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(revenue), 0), 2) AS profit_margin_pct
FROM sales;

-- 2. Revenue and profit by region
SELECT
    region,
    ROUND(SUM(revenue), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM sales
GROUP BY region
ORDER BY total_revenue DESC;

-- 3. Product performance
SELECT
    product,
    SUM(units_sold) AS units_sold,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM sales
GROUP BY product
ORDER BY revenue DESC;

-- 4. Category performance
SELECT
    category,
    ROUND(SUM(revenue), 2) AS revenue,
    ROUND(SUM(profit), 2) AS profit
FROM sales
GROUP BY category
ORDER BY revenue DESC;

-- 5. Monthly revenue trend (SQLite syntax)
SELECT
    strftime('%Y-%m', order_date) AS month,
    ROUND(SUM(revenue), 2) AS monthly_revenue,
    ROUND(SUM(profit), 2) AS monthly_profit
FROM sales
GROUP BY strftime('%Y-%m', order_date)
ORDER BY month;

-- 6. Top 5 products by revenue
SELECT
    product,
    ROUND(SUM(revenue), 2) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;
