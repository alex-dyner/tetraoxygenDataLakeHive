
INSERT INTO adyner.sales_top10_categories
SELECT 
     product_category
    ,qty
FROM adyner.sales_top10_categories_for_all_time
;

/*
select * from adyner.sales_top10_categories
*/

INSERT INTO adyner.sales_top10_product_by_categories
SELECT
     product_category
    ,product_name
    ,sales_qty
    ,product_sales_rank
FROM adyner.sales_top10_product_by_categories_for_all_time
;


/*
select *
from adyner.sales_top10_product_by_categories
*/