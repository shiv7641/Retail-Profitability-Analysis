SELECT 
    COUNT(*) AS orders,
    ROUND(SUM([sales]), 0) AS total_sales,
    ROUND(SUM([profit]), 0) AS total_profit,
    ROUND(100.0 * SUM([profit]) / NULLIF(SUM([sales]), 0), 1) AS profit_margin_pct
FROM dbo.orders;

SELECT                                                                                                                                                                                                       region,
    ROUND(SUM(sales), 0) AS sales,
    ROUND(SUM(profit), 0) AS profit,
    ROUND(100.0 * SUM(profit) / SUM(sales), 1) AS margin_pct
FROM orders                                                                                                                                                                                      GROUP BY region
ORDER BY sales DESC;

SELECT 
    sub_category,
    ROUND(SUM(sales), 0) AS sales,
    ROUND(SUM(profit), 0) AS profit
FROM orders
GROUP BY sub_category
ORDER BY profit ASC;

SELECT 
    CASE 
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.20 THEN '10-20%'
        ELSE '30-40%' 
    END AS discount,
    COUNT(*) AS orders,
    ROUND(100.0 * SUM(profit) / SUM(sales), 1) AS margin_pct
FROM orders
GROUP BY discount
ORDER BY MIN(discount);



