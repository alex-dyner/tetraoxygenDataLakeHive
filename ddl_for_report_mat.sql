
/*Hive*/
create database adyner;

CREATE TABLE adyner.sales_top10_countries (
     country_name varchar(1024)
    ,total_amount decimal(38,2)
)
COMMENT 'Report for top 10 countries by total sales amount'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/adyner/dds/sales_top10_countries'
;


CREATE TABLE adyner.sales_top10_categories (
     product_category varchar(1024)
    ,qty bigint
)
COMMENT 'Report top 10 categories by number of sales'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/adyner/dds/sales_top10_categories'
;


CREATE TABLE adyner.sales_top10_product_by_categories (
     product_category varchar(1024)
    ,product_name varchar(1024)
    ,sales_qty bigint
    ,product_sales_rank tinyint
)
COMMENT 'Report for top 10 products by categories and total sales amount'
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/user/adyner/dds/sales_top10_product_by_categories'
;


