-- =========================================
-- 📊 E-COMMERCE SALES ANALYSIS (SQL)
-- Dataset Columns:
-- order_date, product_name, category, region, quantity, sales, profit
-- =========================================
CREATE DATABASE ecommerce_db;
USE ecommerce_db;
CREATE TABLE sales_data (
    order_date DATE,
    product_name VARCHAR(255),
    category VARCHAR(100),
    region VARCHAR(100),
    quantity INT,
    sales FLOAT,
    profit FLOAT
);

-- 1️⃣ TOTAL SALES & TOTAL PROFIT
SELECT
ROUND(SUM(sales), 2) AS total_sales,
ROUND(SUM(profit), 2) AS total_profit
FROM sales_data;

-- =========================================

-- 2️⃣ MONTHLY SALES TREND
SELECT
DATE_TRUNC('month', order_date) AS month,
SUM(sales) AS revenue
FROM sales_data
GROUP BY month
ORDER BY month;

-- =========================================

-- 3️⃣ TOP 10 PRODUCTS BY SALES
SELECT
product_name,
SUM(sales) AS total_sales
FROM sales_data
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 10;

-- =========================================

-- 4️⃣ CATEGORY-WISE SALES & PROFIT
SELECT
category,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

-- =========================================

-- 5️⃣ REGION-WISE SALES
SELECT
region,
SUM(sales) AS total_sales,
SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

-- =========================================

-- 6️⃣ MOST PROFITABLE PRODUCTS
SELECT
product_name,
SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

-- =========================================

-- 7️⃣ LOSS-MAKING PRODUCTS
SELECT
product_name,
SUM(profit) AS total_profit
FROM sales_data
GROUP BY product_name
HAVING SUM(profit) < 0
ORDER BY total_profit;

-- =========================================

-- 8️⃣ DAILY SALES TREND
SELECT
order_date,
SUM(sales) AS daily_sales
FROM sales_data
GROUP BY order_date
ORDER BY order_date;

-- =========================================

-- 9️⃣ AVERAGE ORDER VALUE
SELECT
ROUND(AVG(sales), 2) AS avg_order_value
FROM sales_data;

-- =========================================

-- 🔟 QUANTITY SOLD BY CATEGORY
SELECT
category,
SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY category
ORDER BY total_quantity DESC;

-- =========================================

-- 1️⃣1️⃣ PROFIT MARGIN BY CATEGORY (%)
SELECT
category,
ROUND(SUM(profit) / SUM(sales) * 100, 2) AS profit_margin_percent
FROM sales_data
GROUP BY category
ORDER BY profit_margin_percent DESC;

-- =========================================

-- 1️⃣2️⃣ BEST REGION BY PROFIT
SELECT
region,
SUM(profit) AS total_profit
FROM sales_data
GROUP BY region
ORDER BY total_profit DESC
LIMIT 1;

-- =========================================

-- 1️⃣3️⃣ REVENUE CONTRIBUTION BY CATEGORY (%)
SELECT
category,
ROUND(SUM(sales) * 100.0 / (SELECT SUM(sales) FROM sales_data), 2) AS revenue_percentage
FROM sales_data
GROUP BY category
ORDER BY revenue_percentage DESC;

-- =========================================

