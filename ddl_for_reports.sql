

/* 5.1 Select top 10  most frequently purchased categories */
CREATE OR REPLACE VIEW adyner.sales_top10_categories_for_all_time
AS
SELECT 
     product_category
    ,count(*) as qty
FROM adyner.sales
GROUP BY product_category
ORDER BY qty DESC
LIMIT 10
;


/* 5.2 Select top 10 most frequently purchased product in each category */
CREATE OR REPLACE VIEW adyner.sales_top10_product_by_categories_for_all_time
AS
SELECT *
FROM (
    SELECT
         product_category
        ,product_name
        ,sales_qty
        ,rank() OVER (PARTITION BY product_category ORDER BY sales_qty DESC) as product_sales_rank
    FROM (
        SELECT 
             product_category
            ,product_name
            ,count(*) as sales_qty
        FROM adyner.sales
        GROUP BY product_category, product_name
    ) as sales_categ_info
) s
WHERE product_sales_rank <= 10
;